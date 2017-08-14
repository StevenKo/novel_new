require 'capybara/dsl'

# encoding: utf-8
class Crawler::Sto
  include Crawler
  include Capybara::DSL

  def crawl_articles novel_id
    nodes = @page_html.css("#webPage a")
    last_node = nodes.last
    /(\d+)-(\d+)/ =~ last_node[:href]
    (1..$2.to_i).each do |i|
      article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link("http://www.sto.cc/" + $1 + "-" + i.to_s)
      next if article
      unless article 
        article = Article.new
        article.novel_id = novel_id
        article.link = "http://www.sto.cc/" + $1 + "-" + i.to_s
        article.title = i.to_s
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
    link = article.link
    Capybara.current_driver = :selenium
    Capybara.app_host = "https://www.sto.cc"
    page.visit(link.gsub("https://www.sto.cc",""))
    sleep 1
    text = page.find("#BookContent").native.text
    text = ZhConv.convert("zh-tw", text.strip, false)

    raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    ArticleText.update_or_create(article_id: article.id, text: text)

    # node = @page_html.css("#BookContent")
    # node.css("span,script").remove
    # text = change_node_br_to_newline(node).strip
    # text = ZhConv.convert("zh-tw", text.strip, false)
    # raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    # ArticleText.update_or_create(article_id: article.id, text: text)
  end

end