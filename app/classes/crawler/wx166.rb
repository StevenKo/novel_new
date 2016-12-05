# encoding: utf-8
class Crawler::Wx166
  include Crawler

  def crawl_articles novel_id
    url = "http://tw.166wx.net"
    nodes = @page_html.css("td.chapterlist a")
    do_not_crawl_from_link = true
    from_link = (FromLink.find_by_novel_id(novel_id).nil?) ? nil : FromLink.find_by_novel_id(novel_id).link
    nodes.each do |node| 
      do_not_crawl_from_link = false if crawl_this_article(from_link,node[:href])
      next if do_not_crawl_from_link

      article = Article.select("articles.id, is_show, title, link, novel_id, subject, num").find_by_link(url + node[:href])
      next if article

      unless article 
        article = Article.new
        article.novel_id = novel_id
        article.link = url + node[:href]
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
    html = @page_html.css("#form1 table[width='960px; line-height: 1.5em;']")
    html.css("script,a").remove
    html.css("h1").remove
    html.css("div[align='center']").remove
    html.css("td[align='center']").remove
    text = html.text.strip
    text = ZhConv.convert("zh-tw", text,false)

    if text.length < 150
      imgs = @page_html.css("#form1 table[width='960px; line-height: 1.5em;']").css("img")
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