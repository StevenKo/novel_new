require 'capybara/dsl'
# encoding: utf-8
class Crawler::Quanben
  include Crawler
  include Capybara::DSL

  def crawl_articles novel_id
    nodes = @page_html.css(".list3 li a")
    novel = Novel.select("id,num,name").find(novel_id)
    do_not_crawl_from_link = true
    from_link = (FromLink.find_by_novel_id(novel_id).nil?) ? nil : FromLink.find_by_novel_id(novel_id).link
    nodes.each do |node|
      do_not_crawl_from_link = false if crawl_this_article(from_link,node[:href])
      next if do_not_crawl_from_link

      article_url = get_article_url(node[:href])
      article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(article_url)
      next if article

      unless article 
        article = Article.new
        article.novel_id = novel_id
        article.link = article_url
        article.title = ZhConv.convert("zh-tw",node.text.strip,false)
        novel = Novel.select("id,num,name").find(novel_id)
        article.subject = novel.name
        article.num = novel.num + 1
        novel.update_column(:num,novel.num + 1)

        article.save
      end
      YqArticleWorker.perform_async(article.id)
    end
    set_novel_last_update_and_num(novel_id)
  end

  def crawl_article article
    link = article.link
    Capybara.current_driver = :selenium
    Capybara.app_host = "http://big5.quanben.io"
    page.visit(link.gsub("http://big5.quanben.io",""))
    sleep 5
    text = page.find(".articlebody").native.text

    # text = change_node_br_to_newline(@page_html.css(".articlebody"))
    text = text.gsub(/[a-zA-Z]/,"")
    text = text.gsub("全本小说网","")
    text = text.gsub("wWw!QuanBEn!CoM","")
    text = text.gsub("(www.quanben.com)","")
    article_text = ZhConv.convert("zh-tw",text,false)
    
    text = article_text
    raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    ArticleText.update_or_create(article_id: article.id, text: text)
  end

end