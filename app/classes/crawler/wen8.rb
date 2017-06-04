# encoding: utf-8
class Crawler::Wen8
  include Crawler

  def crawl_articles novel_id
    nodes = @page_html.css(".lb_mulu")
    do_not_crawl_from_link = true
    from_link = (FromLink.find_by_novel_id(novel_id).nil?) ? nil : FromLink.find_by_novel_id(novel_id).link
    nodes.each do |node|
      subject = ZhConv.convert("zh-tw",node.css(".c_big.top_t").text.gsub("\n","").gsub("\r","").gsub("\t",""),false)
      a_nodes = node.css(".all_chapter a")
      a_nodes.each do |a_node|
        next unless a_node[:href]
        do_not_crawl_from_link = false if crawl_this_article(from_link,a_node[:href])
        next if do_not_crawl_from_link

        article_url = get_article_url(a_node[:href])
        article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(article_url)
        next if article

        unless article 
        article = Article.new
        article.novel_id = novel_id
        article.link = article_url
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
    node = @page_html.css("#nr1")
    text = change_node_br_to_newline(node)
    text = ZhConv.convert("zh-tw", text.strip, false)

    if text.length < 100
      imgs = @page_html.css("#nr1 img")
      text_img = ""
      imgs.each do |img|
        text_img = text_img + img[:src] + "*&&$$*"
      end
      text_img = text_img + "如果看不到圖片, 請更新至新版APP"
      text = text_img
    end

    raise 'Do not crawl the article text ' unless isArticleTextOK(article,text)
    ArticleText.update_or_create(article_id: article.id, text: text)
  end

end