require 'capybara/dsl'
# encoding: utf-8
class Crawler::Dmzj
  include Crawler
  include Capybara::DSL

  def crawl_articles novel_id
    Capybara.current_driver = :selenium
    Capybara.app_host = "http://q.dmzj.com"
    page.visit(page_url.gsub("http://q.dmzj.com",""))
    @page_html = Nokogiri::HTML(page.html)

    nodes = @page_html.css(".xlist").reverse
    chapnames = @page_html.css(".chapname .chapnamesub").reverse
    do_not_crawl_from_link = true
    from_link = (FromLink.find_by_novel_id(novel_id).nil?) ? nil : FromLink.find_by_novel_id(novel_id).link
    nodes.each_with_index do |node,i|

      subject = ZhConv.convert("zh-tw",chapnames[i].text.strip,false)
      a_nodes = node.css("a")
      a_nodes.reverse_each do |a_node|
        do_not_crawl_from_link = false if crawl_this_article(from_link,a_node[:href])
        next if do_not_crawl_from_link

        article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(get_article_url(a_node[:href]))
        next if article
        article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(get_article_url(a_node[:href]).gsub("q.dmzj.com","xs.dmzj.com"))
        next if article

        unless article 
          article = Article.new
          article.novel_id = novel_id
          article.link = get_article_url(a_node[:href])
          article.title = ZhConv.convert("zh-tw",a_node.text.strip,false)
          novel = Novel.select("id,num,name").find(novel_id)
          article.subject = subject
          article.num = novel.num + 1
          novel.update_column(:num,novel.num + 1)
          # puts node.text
          article.save
        end
        ArticleWorker.perform_async(article.id)
      end
    end
    set_novel_last_update_and_num(novel_id)
  end

  def crawl_article article
    article_text = ""
    page_num = @page_html.css('#jump_select option').size - 1
    /\/(\d*)\.shtml/ =~ @page_url
    page = $1
    text = change_node_br_to_newline(@page_html.css("#chapter_contents_first")).strip
    (2..page_num).each do |i|
      url = @page_url.gsub(page,"#{page}_#{i}")
      text,links = crawl_page_article text,url
    end
    article_text = ZhConv.convert("zh-tw",text,false)
    unless isArticleTextOK(article,text)
      imgs = @page_html.css("#novel_contents img")
      text_img = ""
      imgs.each do |img|
          text_img = text_img + get_article_url(img[:src].gsub("../..","")) + "*&&$$*"
      end
      text_img = text_img + "如果看不到圖片, 請更新至新版APP"
      text = text_img
    end

    raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    ArticleText.update_or_create(article_id: article.id, text: article_text)
  end

  def crawl_page_article text,url
    c = Crawler::NovelCrawler.new
    c.fetch get_article_url(url)
    node = c.page_html.css("body")
    node.css("script").remove
    article_text = change_node_br_to_newline(node).strip
    text += article_text
    return text
  end

  def crawl_novel(category_id)
    img_link = @page_html.css(".novel_cover img")[0][:src]
    name = @page_html.css(".novel_cover_text h1")[0].text
    is_serializing = false
    is_serializing = true if @page_html.css(".spanwidth1").text.index("连载中")
    author = @page_html.css("span.spanwidth1")[0].text.gsub("作者：","")
    description = change_node_br_to_newline(@page_html.css("#show_intro")).strip
    link = @page_url
    
    novel = Novel.new
    novel.link = link
    novel.name = ZhConv.convert("zh-tw",name,false)
    novel.author = ZhConv.convert("zh-tw",author,false)
    novel.category_id = category_id
    novel.is_show = true
    novel.is_serializing = is_serializing
    novel.last_update = Time.now.strftime("%m/%d/%Y")
    novel.article_num = "?"
    novel.description = description
    novel.pic = img_link
    novel.save
    CrawlWorker.perform_async(novel.id)
    novel.id
  end

end