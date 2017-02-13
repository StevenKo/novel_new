# encoding: utf-8
module Crawler
  
  require 'nokogiri'
  require 'open-uri'
  require 'net/http'
  
  attr_accessor :page_url, :page_html, :fake_browser_urls, :do_not_encode_urls, :match_url_pattern, :url_host, :url_path, :url_query, :url_proto
  
  def crawl_this_article(from_link,link)
    return true if from_link.nil?
    (from_link == link) ? (return true) : (return false)
  end

  def parse_url url
    /^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$/ =~ url
    @url_proto = $2
    @url_host = $3
    if $6.nil? || $6.include?('html')
      @url_path = $4
    else
      @url_path = $4 + $6
    end
    @url_query = $7
  end

  def get_article_url href
    return href unless href.present?
    if href.start_with?("http")
      href
    elsif href.start_with?("/")
      @url_proto + "://" + @url_host + href + @url_query
    elsif href.include? "html"
      @url_proto + "://" + @url_host + @url_path + href + @url_query
    else
      href
    end
  end

  def fetch url
    @fake_browser_urls = ['www.uukanshu.net','www.akxs6.com','www.365xs.org','www.yqhhy.me','www.uukanshu.com','www.33yq.com','00xs.com','www.7788xiaoshuo.com',"book.rijigu.com","yueduxs.com","b.faloo.com","www.ttzw.com","www.8535.org","6ycn.net","www.readnovel.com","www.d586.com","www.fftxt.com","www.bixiage.com"]
    @do_not_encode_urls = ['ranwen.org','read.jd.com','feizw.com','nch.com.tw','www.feisuzw.com','aiweicn.com','ixs.cc','quledu.com','tw.xiaoshuokan.com','7788xiaoshuo.com','wcxiaoshuo.com','2dollars.com.tw','dushi800','59to.org','book.sfacg','ranwenba','shushu5','kushuku','feiku.com','daomubiji','luoqiu.com','kxwxw','txtbbs.com','tw.57book','b.faloo.com/p/','9pwx.com']
    @page_url = url
    get_page(@page_url)   
  end

  def fetch_without_nokogiri url
    @page_url = url
    body = ''
    begin
      open(url){ |io|
          body = io.read
      }
    rescue
    end
    @page_html = body
  end

  def post_fetch url, option
    @page_url = url
    url = URI.parse(url)
    resp, data = Net::HTTP.post_form(url, option)
    @page_html = Nokogiri::HTML(resp.body)
  end
  
  def get_page url
    
    @page_url = url
    body = ''
    begin
      open(url){ |io|
          body = io.read
      }
    rescue
    end
    if isNeedFakeBrowserUrl(url)
      /#{@match_url_pattern}(.*)/ =~ url
      path = $1
      http = Net::HTTP.new(@match_url_pattern, 80)
      option = {
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',
        'Cookie' => 'ASP.NET_SessionId=mukuvr1brasjhx0ehg0vot3l; lastread=35628%3D0%3D%7C%7C52280%3D0%3D%7C%7C18500%3D0%3D%7C%7C40244%3D158563%3D%u7B2C%u4E94%u767E%u4E03%u5341%u4E94%u7AE0%20%u8C08%u5229%u76CA%uFF0C%u4E0D%u8BB2%u611F%u60C5...%7C%7C29676%3D0%3D; fcip=111; _ga=GA1.2.1208705874.1486953432; _gat=1'
      }
      res = http.get path, option
      content = res.body
      get_nokogiri_html(content)
    elsif isDoNotNeedReEncodeUrl(url)
      @page_html = Nokogiri::HTML(body)
    else
      get_nokogiri_html(body)
    end

    parse_url url
    @page_html
  end

  def get_nokogiri_html body
    tmp = body.encode("utf-8", :undef => :replace, :replace => "?", :invalid => :replace)
    @page_html = Nokogiri::HTML(tmp)
    encoding = @page_html.meta_encoding

    if(encoding == "gbk" || encoding == "gb2312")
      body.force_encoding("gbk")
      body.encode!("utf-8", :undef => :replace, :replace => "", :invalid => :replace)
      @page_html = Nokogiri::HTML.parse body
    elsif(encoding == "big5")
      body.force_encoding("big5")
      body.encode!("utf-8", :undef => :replace, :replace => "", :invalid => :replace)
      @page_html = Nokogiri::HTML(body,nil)
    else
      # some need encode, some needn't , need check
      @page_html = Nokogiri::HTML(body)
    end
  end

  def isDoNotNeedReEncodeUrl(url)
    @do_not_encode_urls.each do |check_pattern|
      return true if url.index(check_pattern)
    end
    return false
  end

  def isNeedFakeBrowserUrl(url)
    @fake_browser_urls.each do |check_pattern|
      if url.index(check_pattern)
        @match_url_pattern = check_pattern
        return true
      end
    end
    return false
  end

  def get_item_href dns, src
    if (/^\/\// =~ src)
      src = "http:" + src
    elsif (/^\// =~ src)
      src = dns + src
    elsif (/\.\./ =~ src)
      src = dns + src[2..src.length]
    else
      src 
    end
  end
  
  def parse_dns
    url_scan = @page_url.scan(/.*?\//)
    dns = url_scan[0] + url_scan[1] + url_scan[2]
  end

  def change_node_br_to_newline node
    content = node.to_html
    content = content.gsub("<br>","\n")
    n = Nokogiri::HTML(content)
    n.text.gsub("</p>","")
  end

  def isArticleTextOK article,text
    return true unless article.is_show if article
    article != nil && text != nil && (text.size > 80 || text.index('.gif') || text.index('.jpg') || text.index('.png'))
  end

  def set_novel_last_update_and_num(novel_id)
    novel = Novel.find(novel_id)
    if novel.articles.show.last
      time = novel.articles.show.last.created_at.localtime.strftime("%y-%m-%d")
      novel.last_update = time
      novel.article_num = novel.articles.show.size.to_s + "篇"
      novel.save
    end
  end

  
end