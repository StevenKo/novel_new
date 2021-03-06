# encoding: utf-8
class Crawler::Quanbenxiaoshuo
  include Crawler

  def crawl_articles novel_id
    nodes = @page_html.css("ul li[itemprop='itemListElement'] a")
    next_article = true
    do_not_crawl_from_link = true
    from_link = (FromLink.find_by_novel_id(novel_id).nil?) ? nil : FromLink.find_by_novel_id(novel_id).link
    nodes.each do |node|      
      do_not_crawl_from_link = false if crawl_this_article(from_link,node[:href])
      next if do_not_crawl_from_link
      
      if novel_id == 6428
        next_article = false if node[:href] == "http://quanben-xiaoshuo.com/read/5/langyabang/1/139.html"
        next if next_article
      end
      if novel_id == 10803
        next_article = false if node[:href] == "http://quanben-xiaoshuo.com/read/6/chuanyuezhiyanzhidasong/1/139.html"
        next if next_article
      end
      if novel_id == 5904
        next_article = false if node[:href] == "http://quanben-xiaoshuo.com/read/14/wangyouzhiwangpaizhanshi/1/449.html"
        next if next_article
      end
      if novel_id == 2551
        next_article = false if node[:href] == "http://quanben-xiaoshuo.com/read/5/youlingjujishou/1/91.html"
        next if next_article
      end
      url = get_article_url(node[:href])
      article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(url)
      next if article

      unless article 
        article = Article.new
        article.novel_id = novel_id
        article.link = url
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
    node = @page_html.css("#articlebody")
    node.css("a").remove
    node.css("script").remove
    text = change_node_br_to_newline(node)
    text = ZhConv.convert("zh-tw", text.strip, false)
    raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    ArticleText.update_or_create(article_id: article.id, text: text)
  end

end