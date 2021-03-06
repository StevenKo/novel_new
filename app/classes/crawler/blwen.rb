# encoding: utf-8
class Crawler::Blwen
  include Crawler

  def crawl_articles novel_id
    nodes = @page_html.css(".jogger2 a")
    last_node = nodes[nodes.size-2]
    
    url = @page_url.gsub(".html","")
    article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(@page_url)
    unless article 
      article = Article.new
      article.novel_id = novel_id
      article.link = @page_url
      article.title = "1"
      novel = Novel.select("id,num,name").find(novel_id)
      article.subject = novel.name
      article.num = novel.num + 1
      novel.update_column(:num,novel.num + 1)
      # puts node.text
      article.save
    end
    ArticleWorker.perform_async(article.id)

    /(\d*)_(\d*)/ =~ last_node[:href]
    (2..$2.to_i).each do |i|
      article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(url + "_" + i.to_s + ".html")
      next if article
      unless article 
        article = Article.new
        article.novel_id = novel_id
        article.link = url + "_" + i.to_s + ".html"
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
    node = @page_html.css(".artz")
    node.css("span,script,#showpagefontsize").remove
    text = change_node_br_to_newline(node).strip
    text = ZhConv.convert("zh-tw", text.strip, false)
    raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    ArticleText.update_or_create(article_id: article.id, text: text)
  end

end