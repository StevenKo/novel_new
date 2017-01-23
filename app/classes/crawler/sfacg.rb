# encoding: utf-8
class Crawler::Sfacg
  include Crawler

  def crawl_articles novel_id
    do_not_crawl = true
    do_not_crawl_from_link = true
    from_link = (FromLink.find_by_novel_id(novel_id).nil?) ? nil : FromLink.find_by_novel_id(novel_id).link

    stories = @page_html.css(".story-catalog")
    stories.each do |store|
      subject = store.css(".catalog-title").text
      nodes = store.css(".catalog-list a")
      nodes.each do |node|
        do_not_crawl_from_link = false if crawl_this_article(from_link,node[:href])
        next if do_not_crawl_from_link

        node[:href] = node[:href][0..-2] if node[:href][-1] == "\/"
        break if node[:href].include? "vip"
        article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(get_article_url(node[:href]))
        next if article

        unless article 
          article = Article.new
          article.novel_id = novel_id
          article.link = get_article_url(node[:href])
          article.title = ZhConv.convert("zh-tw",node.text.strip,false)
          novel = Novel.select("id,num,name").find(novel_id)
          article.subject = subject
          article.num = novel.num + 1
          novel.update_column(:num,novel.num + 1)
          article.save
        end
        ArticleWorker.perform_async(article.id) 
      end
    end
    set_novel_last_update_and_num(novel_id)
  end

  def crawl_article article
    node = @page_html.css("#ChapterBody")
    text = change_node_br_to_newline(node).strip
    
    if text.gsub("\n","").gsub(" ","").length < 50
      url = "http://book.sfacg.com"
      imgs = @page_html.css("#ChapterBody img")
      text_img = ""
      imgs.each do |img|
        if img[:src].index("ttp://")
          text_img = text_img + img[:src] + "*&&$$*"
        else
          text_img = text_img + url + img[:src] + "*&&$$*"
        end
      end
      text_img = text_img + "如果看不到圖片, 請更新至新版"
      text = text_img
    else
      text = ZhConv.convert("zh-tw", text,false)
    end
    raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    ArticleText.update_or_create(article_id: article.id, text: text)
  end

  def crawl_novel(category_id)
    img_link = @page_html.css("li.cover img")[0][:src]
    name = @page_html.css("li.cover img")[0][:title]
    is_serializing = false
    is_serializing = true if @page_html.css(".synopsises_font").text.index("连载中")
    author = @page_html.css(".synopsises_font a")[1].text
    des_node = @page_html.css(".synopsises_font li")[1]
    des_node.css("img,span,script,a").remove
    description = change_node_br_to_newline(des_node).strip
    link = @page_url + "MainIndex/"
    
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