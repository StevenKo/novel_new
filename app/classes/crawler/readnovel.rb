# encoding: utf-8
class Crawler::Readnovel
  include Crawler
  include Capybara::DSL

  def crawl_articles novel_id
    Capybara.current_driver = :selenium
    Capybara.app_host = "http://www.readnovel.com/"
    page.visit(@page_url.gsub("http://www.readnovel.com/",""))
    page.visit(@page_url.gsub("http://www.readnovel.com/",""))

    nodes = page.all(".ML_ul li a")
    nodes.each do |node|
      article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(node[:href])
      next if article

      unless article 
        article = Article.new
        article.novel_id = novel_id
        article.link = node[:href]
        article.title = ZhConv.convert("zh-tw",node.text.strip,false)
        novel = Novel.select("id,num,name").find(novel_id)
        article.subject = novel.name
        article.num = novel.num + 1
        novel.update_column(:num,novel.num + 1)
        # puts node.text
        article.save
      end
      ArticleWorker.perform_async(article.id)
    end  
    set_novel_last_update_and_num(novel_id)
  end

  def crawl_article article
    @page_html.css(".miaoshu,.zhichi,.bottomAdbanner").remove
    text = change_node_br_to_newline(@page_html.css(".zhangjie")).strip
    text = ZhConv.convert("zh-tw", text.strip, false)
    raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    ArticleText.update_or_create(article_id: article.id, text: text)
  end

end