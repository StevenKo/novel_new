# encoding: UTF-8

class CrawlerAdapter
  
  attr_accessor :adapter_map

  def self.adapter_map
    {
      '燃文小说网net' => {'pattern'=>'/ranwen.net/si','name'=>'Ranwen','crawl_site_articles' => true,'recommend' => true},
      '穿越小说吧131' => {'pattern'=>'/sj131.com/si','name'=>'Sj131','crawl_site_articles' => true,'recommend' => true},
      '我看书斋' => {'pattern'=>'/5ccc.net/si','name'=>'Ccc5','crawl_site_articles' => true,'recommend' => true},
      '落秋中文' => {'pattern'=>'/luoqiu.com/si','name'=>'Luoqiu','crawl_site_articles' => true,'recommend' => true},
      '飞卢小说网' => {'pattern'=>'/b.faloo.com/si','name'=>'Faloo','crawl_site_articles' => true,'recommend' => true},
      '伍九文学' => {'pattern'=>'/59to.com/si','name'=>'To59','crawl_site_articles' => true,'recommend' => true},
      '59文学' => {'pattern'=>'/59to.org/si','name'=>'To59Org','crawl_site_articles' => true,'recommend' => true},
      'SF轻小说' => {'pattern'=>'/book.sfacg.com/si','name'=>'Sfacg','crawl_site_articles' => true,'recommend' => true},
      # '《小说阅读网》' => {'pattern'=>'/readnovel.com/si','name'=>'Readnovel','crawl_site_articles' => true,'recommend' => true},
      '轻小说文库' => {'pattern'=>'/wenku8.com/si','name'=>'Wenku8','crawl_site_articles' => true,'recommend' => true},
      '努努' => {'pattern'=>'/book.kanunu.org/si','name'=>'Kanunu','crawl_site_articles' => true,'recommend' => true},
      '努努2' => {'pattern'=>'/kanunu8.com/si','name'=>'Kanunu8','crawl_site_articles' => true,'recommend' => true},

      # '轻之国度-论坛' => {'pattern'=>'/lightnovel.cn/si','name'=>'Lightnovel','crawl_site_articles' => true,'recommend' => false},
      # '天使輕小說' => {'pattern'=>'/m.7tianshi.com/si','name'=>'Tianshi7','crawl_site_articles' => true,'recommend' => false},

      '燃文小说网org' => {'pattern'=>'/ranwen.org/si','name'=>'Ranwen','crawl_site_articles' => true,'recommend' => true},
      '读一读小说网' => {'pattern'=>'/duyidu.com/si','name'=>'Duyidu','crawl_site_articles' => true,'recommend' => false},
      '精品文學' => {'pattern'=>'/bestory.com/si','name'=>'Bestory','crawl_site_articles' => true,'recommend' => false},
      '卡提諾論壇' => {'pattern'=>'/ck101.com/si','name'=>'Ck101','crawl_site_articles' => true,'recommend' => false},
      '飛天中文' => {'pattern'=>'/gosky.net/si','name'=>'Gosky','crawl_site_articles' => true,'recommend' => false},
      '全書網' => {'pattern'=>'/quanshu.net/si','name'=>'Quanshu','crawl_site_articles' => true,'recommend' => false},
      '非凡txt' => {'pattern'=>'/fftxt.net/si','name'=>'Fftxt','crawl_site_articles' => true,'recommend' => false},
      '八拍網' => {'pattern'=>'/8apa.com/si','name'=>'Apa','crawl_site_articles' => true,'recommend' => false},
      '校園文學' => {'pattern'=>'/xybook.net/si','name'=>'Xybook','crawl_site_articles' => true,'recommend' => false},
      '思兔網' => {'pattern'=>'/sto.cc/si','name'=>'Sto','crawl_site_articles' => true,'recommend' => false},
      # 'A咖社區' => {'pattern'=>'/aka99.com/si','name'=>'Aka99','crawl_site_articles' => true,'recommend' => false},
      '言情' => {'pattern'=>'/yqhhy.cc/si','name'=>'Yqhhy','crawl_site_articles' => true,'recommend' => false},
      '棋子' => {'pattern'=>'/qizi.cc/si','name'=>'Qizi','crawl_site_articles' => true,'recommend' => false},
      '潇湘書院' => {'pattern'=>'/xxsy.net/si','name'=>'Xxsy','crawl_site_articles' => true,'recommend' => false},
      '言情小說' => {'pattern'=>'/yqxs.com/si','name'=>'Yqxs','crawl_site_articles' => true,'recommend' => false},
      '文山小說' => {'pattern'=>'/wsxs.net/si','name'=>'Wsxs','crawl_site_articles' => true,'recommend' => false},
      '天天小說' => {'pattern'=>'/ttshuo.com/si','name'=>'Ttshuo','crawl_site_articles' => true,'recommend' => false},
      '飛庫網' => {'pattern'=>'/feiku.com/si','name'=>'Feiku','crawl_site_articles' => true,'recommend' => false},
      '小說者' => {'pattern'=>'/xiaoshuozhe.com/si','name'=>'Xiaoshuozhe','crawl_site_articles' => true,'recommend' => false},
      '5800' => {'pattern'=>'/5800.cc/si','name'=>'Cc5800','crawl_site_articles' => true,'recommend' => false},
      '黃金屋中文(台灣)' => {'pattern'=>'/tw.hjwzw.com/si','name'=>'Hjwzw','crawl_site_articles' => true,'recommend' => false},
      '手打小说网' => {'pattern'=>'/xs555.com/si','name'=>'Xs555','crawl_site_articles' => true,'recommend' => false},
      '书迷楼' => {'pattern'=>'/shumilou.com|shumilou.co/si','name'=>'Shumilou','crawl_site_articles' => true,'recommend' => false},
      '书迷楼org' => {'pattern'=>'/shumilou.org/si','name'=>'Shumilouorg','crawl_site_articles' => true,'recommend' => false},
      '玄葫堂' => {'pattern'=>'/xuanhutang.com/si','name'=>'Xuanhutang','crawl_site_articles' => true,'recommend' => false},
      '剑侠' => {'pattern'=>'/jianxia.cc/si','name'=>'Jianxia','crawl_site_articles' => true,'recommend' => false},
      '全本小说网quanben' => {'pattern'=>'/quanben.com/si','name'=>'Quanben','crawl_site_articles' => true,'recommend' => false},
      'D586' => {'pattern'=>'/d586.com/si','name'=>'D586','crawl_site_articles' => true,'recommend' => false},
      '書吧' => {'pattern'=>'/shu88.net/si','name'=>'Shu88','crawl_site_articles' => true,'recommend' => false},
      '大文学' => {'pattern'=>'/dawenxue.net/si','name'=>'Dawenxue','crawl_site_articles' => true,'recommend' => false},
      '燃痕' => {'pattern'=>'/ranhen.net/si','name'=>'Ranhen','crawl_site_articles' => true,'recommend' => false},
      '盗墓笔记-盗墓笔记全集' => {'pattern'=>'/daomubiji.com/si','name'=>'Daomubiji','crawl_site_articles' => true,'recommend' => false},
      '御前侍卫 ' => {'pattern'=>'/yuqianshiwei.com/si','name'=>'Yuqianshiwei','crawl_site_articles' => true,'recommend' => false},
      '冒險者天堂' => {'pattern'=>'/paradise.ezla.com/si','name'=>'Paradise','crawl_site_articles' => true,'recommend' => false},
      '盗墓小说网' => {'pattern'=>'/daomuxsw.com/si','name'=>'Daomuxsw','crawl_site_articles' => true,'recommend' => false},
      '仙界小说网' => {'pattern'=>'/xianjie.me/si','name'=>'Xianjie','crawl_site_articles' => true,'recommend' => false},
      '红枫小说阅读网' => {'pattern'=>'/hfxs.com/si','name'=>'Hfxs','crawl_site_articles' => true,'recommend' => true},
      '思路客小说阅读网' => {'pattern'=>'/siluke.com/si','name'=>'Siluke','crawl_site_articles' => true,'recommend' => false},
      '明智屋小說網' => {'pattern'=>'/tw.mingzw.com/si','name'=>'Mingzw','crawl_site_articles' => true,'recommend' => false},
      # '520小说' => {'pattern'=>'/520xs.com/si','name'=>'Xs520','crawl_site_articles' => true,'recommend' => false},
      '新小說吧' => {'pattern'=>'/xxs8.com/si','name'=>'Xxs8','crawl_site_articles' => true,'recommend' => false},
      '好看小說網' => {'pattern'=>'/tw.xiaoshuokan.com/si','name'=>'Xiaoshuokan','crawl_site_articles' => true,'recommend' => false},
      'uuxs' => {'pattern'=>'/uuxs.com/si','name'=>'Uuxs','crawl_site_articles' => true,'recommend' => false},
      '就爱网-小说阅读' => {'pattern'=>'/92txt.net/si','name'=>'Txt92','crawl_site_articles' => true,'recommend' => false},
      '燃文小说网' => {'pattern'=>'/ranwenxiaoshuo.com/si','name'=>'Ranwenxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      '闪文书库' => {'pattern'=>'/shanwen.com/si','name'=>'Shanwen','crawl_site_articles' => true,'recommend' => false},
      '全本小说网,' => {'pattern'=>'/qbxiaoshuo.com/si','name'=>'Qbxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      '玄幻小说网' => {'pattern'=>'/xhxsw.com/si','name'=>'Xhxsw','crawl_site_articles' => true,'recommend' => false},
      '波斯小说网' => {'pattern'=>'/bsxsw.com/si','name'=>'Bsxsw','crawl_site_articles' => true,'recommend' => false},
      '读趣网' => {'pattern'=>'/du7.com/si','name'=>'Du7','crawl_site_articles' => true,'recommend' => false},
      '乐文,乐文小说网' => {'pattern'=>'/lwxs.net/si','name'=>'Lwxs','crawl_site_articles' => true,'recommend' => false},
      '乐文,乐文小说网 .Com' => {'pattern'=>'/lwxs.com/si','name'=>'Lwxs','crawl_site_articles' => true,'recommend' => false},
      '雅文言情小说吧' => {'pattern'=>'/yawen8.com/si','name'=>'Yawen8','crawl_site_articles' => true,'recommend' => false},
      '玫瑰言情網' => {'pattern'=>'/mgyqw.com/si','name'=>'Mgyqw','crawl_site_articles' => true,'recommend' => false},
      '微小说 日记谷日记网' => {'pattern'=>'/www.rijigu.com/si','name'=>'Rijigu','crawl_site_articles' => true,'recommend' => false},
      '开心文学网' => {'pattern'=>'/kxwxw.com/si','name'=>'Kxwxw','crawl_site_articles' => true,'recommend' => false},
      '大众小说网' => {'pattern'=>'/dzxsw/si','name'=>'Dzxsw','crawl_site_articles' => true,'recommend' => false},
      'Zwwx' => {'pattern'=>'/zwwx.com/si','name'=>'Zwwx','crawl_site_articles' => true,'recommend' => true},
      '言情小说吧' => {'pattern'=>'/xs8.cn/si','name'=>'Xs8','crawl_site_articles' => true,'recommend' => false},
      '言情小说吧2' => {'pattern'=>'/xs8.com.cn/si','name'=>'Xs8','crawl_site_articles' => true,'recommend' => false},
      '5200小说网-吾爱小说' => {'pattern'=>'/5200xs.net/si','name'=>'Xs5200','crawl_site_articles' => true,'recommend' => false},
      '5200小说网' => {'pattern'=>'/5200.net/si','name'=>'Net5200','crawl_site_articles' => true,'recommend' => false},
      '爱尚小说网' => {'pattern'=>'/23hh.com/si','name'=>'Hh23','crawl_site_articles' => true,'recommend' => false},
      '白金小说网' => {'pattern'=>'/bjxiaoshuo.com/si','name'=>'Bjxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      '飞翔鸟中文网' => {'pattern'=>'/fxnzw.com/si','name'=>'Fxnzw','crawl_site_articles' => true,'recommend' => false},
      '梦远书城' => {'pattern'=>'/my285.com/si','name'=>'My285','crawl_site_articles' => true,'recommend' => false},
      '無極小說網' => {'pattern'=>'/tw.57book.net/si','name'=>'Book57','crawl_site_articles' => true,'recommend' => false},
      # '宙斯' => {'pattern'=>'/zhsxs.com/si','name'=>'Zhsxs','crawl_site_articles' => true,'recommend' => false},
      '金榜阅读' => {'pattern'=>'/jinbang.org/si','name'=>'Jinbang','crawl_site_articles' => true,'recommend' => false},
      '猎人小说' => {'pattern'=>'/orion34g.com/si','name'=>'Orion34g','crawl_site_articles' => true,'recommend' => false},
      '第五文学' => {'pattern'=>'/d5wx.com/si','name'=>'D5wx','crawl_site_articles' => true,'recommend' => false},
      '大主宰' => {'pattern'=>'/dz320.com/si','name'=>'Dz320','crawl_site_articles' => true,'recommend' => false},
      '穿越小说吧' => {'pattern'=>'/qbxs8/si','name'=>'Qbxs8','crawl_site_articles' => true,'recommend' => false},
      '晋江文学城' => {'pattern'=>'/jjwxc.net/si','name'=>'Jjwxc','crawl_site_articles' => true,'recommend' => false},
      '自在读小说网' => {'pattern'=>'/zizaidu.com/si','name'=>'Zizaidu','crawl_site_articles' => true,'recommend' => false},
      '滋味小说网' => {'pattern'=>'/zwxiaoshuo.com/si','name'=>'Zwxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      '小说-17K小说网' => {'pattern'=>'/17k.com/si','name'=>'K17','crawl_site_articles' => true,'recommend' => false},
      '天天中文' => {'pattern'=>'/ttzw.com/si','name'=>'Ttzw','crawl_site_articles' => true,'recommend' => true},
      '最言情小说吧' => {'pattern'=>'/zuiyq.com/si','name'=>'Zuiyq','crawl_site_articles' => true,'recommend' => false},
      '六夜言情网' => {'pattern'=>'/6yzw.com/si','name'=>'Y6zw','crawl_site_articles' => true,'recommend' => false},
      '都市文学' => {'pattern'=>'/dushiwenxue.com/si','name'=>'Dushiwenxue','crawl_site_articles' => true,'recommend' => false},
      '小说者' => {'pattern'=>'/bookzx.net/si','name'=>'Bookzx','crawl_site_articles' => true,'recommend' => false},
      '免费小说阅读网-书农在线书库' => {'pattern'=>'/shunong.com/si','name'=>'Shunong','crawl_site_articles' => true,'recommend' => false},
      '书书网' => {'pattern'=>'/shushu.com.cn/si','name'=>'Shushu','crawl_site_articles' => true,'recommend' => false},
      '冠华居小说网' => {'pattern'=>'/guanhuaju.com/si','name'=>'Guanhuaju','crawl_site_articles' => true,'recommend' => false},
      '摘书小说网' => {'pattern'=>'/zhaishu.com|zhaishu8.com/si','name'=>'Zhaishu','crawl_site_articles' => true,'recommend' => false},
      '书书屋' => {'pattern'=>'/shushu5.com/si','name'=>'Shushu5','crawl_site_articles' => true,'recommend' => false},
      '第二书包网' => {'pattern'=>'/shubao2.com/si','name'=>'Shubao2','crawl_site_articles' => true,'recommend' => false},
      # '纵横中文网' => {'pattern'=>'/big5.zongheng.com/si','name'=>'Zongheng','crawl_site_articles' => true,'recommend' => false},
      '起點中文' => {'pattern'=>'/qidian.com/si','name'=>'Qidian','crawl_site_articles' => true,'recommend' => false},
      # '燃文小说阅读网cc' => {'pattern'=>'/ranwen.cc/si','name'=>'RanwenCc','crawl_site_articles' => true,'recommend' => false},
      '海天中文' => {'pattern'=>'/htzw.net/si','name'=>'Htzw','crawl_site_articles' => true,'recommend' => false},
      'YY書屋' => {'pattern'=>'/bbs.yys5.com/si','name'=>'Yys5','crawl_site_articles' => true,'recommend' => false},
      '言情小屋' => {'pattern'=>'/yqxw.net/si','name'=>'Yqxw','crawl_site_articles' => true,'recommend' => false},
      '天天书吧' => {'pattern'=>'/ttshu8.com/si','name'=>'Ttshu8','crawl_site_articles' => true,'recommend' => false},
      'TXT小说下载' => {'pattern'=>'/txtbbs.com/si','name'=>'Txtbbs','crawl_site_articles' => true,'recommend' => false},
      '熱閱讀' => {'pattern'=>'/reyuedu.com/si','name'=>'Reyuedu','crawl_site_articles' => true,'recommend' => false},
      '天異文學' => {'pattern'=>'/tianyibook.com/si','name'=>'Tianyibook','crawl_site_articles' => true,'recommend' => false},
      '看啦又看小说网' => {'pattern'=>'/k6uk.com/si','name'=>'K6uk','crawl_site_articles' => true,'recommend' => false},
      '笔下阁' => {'pattern'=>'/bixiage.com/si','name'=>'Bixiage','crawl_site_articles' => true,'recommend' => false},
      '皮皮小說網' => {'pattern'=>'/ppxsw.com/si','name'=>'Ppxsw','crawl_site_articles' => true,'recommend' => false},
      '无错小说网' => {'pattern'=>'/wcxiaoshuo.com/si','name'=>'Wcxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      '夢想島中文' => {'pattern'=>'/tw.mxdzw.com/si','name'=>'Mxdzw','crawl_site_articles' => true,'recommend' => false},
      '书客居' => {'pattern'=>'/shukeju.com/si','name'=>'Shukeju','crawl_site_articles' => true,'recommend' => false},
      '乐读窝' => {'pattern'=>'/leduwo.com/si','name'=>'Leduwo','crawl_site_articles' => true,'recommend' => false},
      '17xie' => {'pattern'=>'/17xie.com/si','name'=>'Xie17','crawl_site_articles' => true,'recommend' => false},
      '136txt' => {'pattern'=>'/136txt.com/si','name'=>'Txt136','crawl_site_articles' => true,'recommend' => false},
      '136书屋' => {'pattern'=>'/136book.com/si','name'=>'Book136','crawl_site_articles' => true,'recommend' => false},
      '免费小说网' => {'pattern'=>'/xstxw.com/si','name'=>'Xstxw','crawl_site_articles' => true,'recommend' => false},
      # '藏海花' => {'pattern'=>'/zanghaihuatxt.com/si','name'=>'Zanghaihuatxt','crawl_site_articles' => true,'recommend' => false},
      '都市中文網' => {'pattern'=>'/dushi800.com/si','name'=>'Dushi800','crawl_site_articles' => true,'recommend' => false},
      '啪啪小說網' => {'pattern'=>'/papaxs.com/si','name'=>'Papaxs','crawl_site_articles' => true,'recommend' => false},
      # 'daomutxt' => {'pattern'=>'/daomutxt.com/si','name'=>'Daomutxt','crawl_site_articles' => true,'recommend' => false},
      'fyxs' => {'pattern'=>'/fyxs.net/si','name'=>'Fyxs','crawl_site_articles' => true,'recommend' => false},
      '爬書網' => {'pattern'=>'/pashuw.com/si','name'=>'Pashuw','crawl_site_articles' => true,'recommend' => false},
      '魅族小說網' => {'pattern'=>'/meizoo.com/si','name'=>'Meizoo','crawl_site_articles' => true,'recommend' => false},
      '纯文学网站首页' => {'pattern'=>'/purepen.com/si','name'=>'Purepen','crawl_site_articles' => true,'recommend' => false},
      '零点书院' => {'pattern'=>'/00sy.com/si','name'=>'Sy00','crawl_site_articles' => true,'recommend' => false},
      '由美論壇' => {'pattern'=>'/urmay.com/si','name'=>'Urmay','crawl_site_articles' => true,'recommend' => false},
      '有木有小说网' => {'pattern'=>'/ymyxsw.com/si','name'=>'Ymyxsw','crawl_site_articles' => true,'recommend' => false},
      '嗡嗡嗡論壇' => {'pattern'=>'/2dollars.com.tw/si','name'=>'Dollars2','crawl_site_articles' => true,'recommend' => false},
      '夢書吧' => {'pattern'=>'/mengshuba.com/si','name'=>'Mengshuba','crawl_site_articles' => true,'recommend' => false},
      '雲台書屋' => {'pattern'=>'/b111.net/si','name'=>'B111','crawl_site_articles' => true,'recommend' => false},
      '異界小說網' => {'pattern'=>'/yjxs.net/si','name'=>'Yjxs','crawl_site_articles' => true,'recommend' => false},
      '無線電子書' => {'pattern'=>'/wxdzs.com/si','name'=>'Wxdzs','crawl_site_articles' => true,'recommend' => false},
      'piaotian' => {'pattern'=>'/piaotian.net/si','name'=>'Piaotian','crawl_site_articles' => true,'recommend' => false},
      '穿越迷首页' => {'pattern'=>'/chuanyuemi.com/si','name'=>'Chuanyuemi','crawl_site_articles' => true,'recommend' => false},
      '紅櫻桃' => {'pattern'=>'/cherry123.com/si','name'=>'Cherry123','crawl_site_articles' => true,'recommend' => false},
      '360doc' => {'pattern'=>'/360doc.com/si','name'=>'Doc360','crawl_site_articles' => true,'recommend' => false},
      'daomubiji' => {'pattern'=>'/daomubiji.cc/si','name'=>'Daomubiji2','crawl_site_articles' => true,'recommend' => false},
      'yaochi' => {'pattern'=>'/yaochi.me/si','name'=>'Yaochi','crawl_site_articles' => true,'recommend' => false},
      'ftxsy' => {'pattern'=>'/ftxsy.com/si','name'=>'Ftxsy','crawl_site_articles' => true,'recommend' => false},
      'LwxsOrg' => {'pattern'=>'/lwxs.org/si','name'=>'LwxsOrg','crawl_site_articles' => true,'recommend' => false},
      'Lewenxiaoshuo' => {'pattern'=>'/lewenxiaoshuo.com/si','name'=>'Lewenxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      'Biqugezw' => {'pattern'=>'/biqugezw.com/si','name'=>'Biqugezw','crawl_site_articles' => true,'recommend' => false},
      'Biquge' => {'pattern'=>'/www.biquge/si','name'=>'Biquge','crawl_site_articles' => true,'recommend' => false},
      'Mucanwenxue' => {'pattern'=>'/mucanwenxue.com/si','name'=>'Mucanwenxue','crawl_site_articles' => true,'recommend' => false},
      'Xbiquge' => {'pattern'=>'/www.xbiquge.com/si','name'=>'Xbiquge','crawl_site_articles' => true,'recommend' => false},
      'snwx' => {'pattern'=>'/www.snwx.com/si','name'=>'Snwx','crawl_site_articles' => true,'recommend' => false},
      '扒書網' => {'pattern'=>'/tw.8shuw.net/si','name'=>'Shuw8','crawl_site_articles' => true,'recommend' => false},
      '小说路上' => {'pattern'=>'/xs63.com/si','name'=>'Xs63','crawl_site_articles' => true,'recommend' => false},
      '六九中文' => {'pattern'=>'/www.69zw.com/si','name'=>'Zw69','crawl_site_articles' => true,'recommend' => false},
      '123言情' => {'pattern'=>'/www.33yq.com/si','name'=>'Yq33','crawl_site_articles' => true,'recommend' => false},
      '39小说网风云榜' => {'pattern'=>'/www.39txt.com/si','name'=>'Txt39','crawl_site_articles' => true,'recommend' => false},
      '00小說' => {'pattern'=>'/00xs.com/si','name'=>'Xs00','crawl_site_articles' => true,'recommend' => false},
      '69shu' => {'pattern'=>'/69shu.com/si','name'=>'Shu69','crawl_site_articles' => true,'recommend' => false},
      # 'blwen' => {'pattern'=>'/blwen.com/si','name'=>'Blwen','crawl_site_articles' => true,'recommend' => false},
      'Niubb' => {'pattern'=>'/niubb.net/si','name'=>'Niubb','crawl_site_articles' => true,'recommend' => false},
      'Blnovel' => {'pattern'=>'/blnovel.com/si','name'=>'Blnovel','crawl_site_articles' => true,'recommend' => false},
      'sogo論壇' => {'pattern'=>'/oursogo.com/si','name'=>'Oursogo','crawl_site_articles' => true,'recommend' => false},
      '365xs' => {'pattern'=>'/365xs.org/si','name'=>'Xs365','crawl_site_articles' => true,'recommend' => false},
      'Pinkcorpse' => {'pattern'=>'/pinkcorpse.org/si','name'=>'Pinkcorpse','crawl_site_articles' => true,'recommend' => false},
      '7cct' => {'pattern'=>'/7cct.com/si','name'=>'Cct7','crawl_site_articles' => true,'recommend' => false},
      'xklxsw' => {'pattern'=>'/xklxsw.com/si','name'=>'Xklxsw','crawl_site_articles' => true,'recommend' => false},
      '可乐小说网' => {'pattern'=>'/klxsw.com/si','name'=>'Klxsw','crawl_site_articles' => true,'recommend' => false},
      '夜玥論壇' => {'pattern'=>'/ds-hk.net/si','name'=>'Dshk','crawl_site_articles' => true,'recommend' => false},
      '无图小说网' => {'pattern'=>'/wutuxs.com/si','name'=>'Wutuxs','crawl_site_articles' => true,'recommend' => false},
      '看书屋' => {'pattern'=>'/kanshuwu.net/si','name'=>'Kanshuwu','crawl_site_articles' => true,'recommend' => false},
      '极度书库' => {'pattern'=>'/jidubook.com/si','name'=>'Jidubook','crawl_site_articles' => true,'recommend' => false},
      '喜看看' => {'pattern'=>'/xikankan.com/si','name'=>'Xikankan','crawl_site_articles' => true,'recommend' => false},
      '巴巴乐中文' => {'pattern'=>'/26953.com/si','name'=>'R26953','crawl_site_articles' => true,'recommend' => false},
      '伊莉小說網' => {'pattern'=>'/ylxs.cc/si','name'=>'Ylxs','crawl_site_articles' => true,'recommend' => false},
      '全本小说网quanbenxiaoshuo' => {'pattern'=>'/quanben-xiaoshuo.com/si','name'=>'Quanbenxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      'Remenxs' => {'pattern'=>'/remenxs.com/si','name'=>'Remenxs','crawl_site_articles' => true,'recommend' => false},
      'Shubao22' => {'pattern'=>'/shubao22.com/si','name'=>'Shubao22','crawl_site_articles' => true,'recommend' => false},
      'ybdu' => {'pattern'=>'/ybdu.com/si','name'=>'Ybdu','crawl_site_articles' => true,'recommend' => false},
      'xsyqw' => {'pattern'=>'/xsyqw.com/si','name'=>'Xsyqw','crawl_site_articles' => true,'recommend' => false},
      'mpzw' => {'pattern'=>'/mpzw.com/si','name'=>'Mpzw','crawl_site_articles' => true,'recommend' => false},
      'cmxsw' => {'pattern'=>'/cmxsw.com/si','name'=>'Cmxsw','crawl_site_articles' => true,'recommend' => false},
      # 'yinyangdailiren' => {'pattern'=>'/yinyangdailiren.com/si','name'=>'Yinyangdailiren','crawl_site_articles' => true,'recommend' => false},
      '5du5' => {'pattern'=>'/5du5.com/si','name'=>'Du55','crawl_site_articles' => true,'recommend' => false},
      'pinwenba' => {'pattern'=>'/pinwenba.com/si','name'=>'Pinwenba','crawl_site_articles' => true,'recommend' => false},
      'quledu' => {'pattern'=>'/quledu.com/si','name'=>'Quledu','crawl_site_articles' => true,'recommend' => false},
      'daomengren' => {'pattern'=>'/daomengren.com/si','name'=>'Daomengren','crawl_site_articles' => true,'recommend' => false},
      '88dushu' => {'pattern'=>'/88dushu.com/si','name'=>'Dushu88','crawl_site_articles' => true,'recommend' => false},
      'Xiaoshuocity' => {'pattern'=>'/xiaoshuocity.com/si','name'=>'Xiaoshuocity','crawl_site_articles' => true,'recommend' => false},
      'shushuw' => {'pattern'=>'/shushuw.cn/si','name'=>'Shushuw','crawl_site_articles' => true,'recommend' => false},
      'sbkk8' => {'pattern'=>'/sbkk8.cn/si','name'=>'Sbkk8','crawl_site_articles' => true,'recommend' => false},
      'biquguan' => {'pattern'=>'/biquguan.com/si','name'=>'Biquguan','crawl_site_articles' => true,'recommend' => false},
      'lewen8' => {'pattern'=>'/lewen8.com/si','name'=>'Lewen8','crawl_site_articles' => true,'recommend' => false},
      'biquwo' => {'pattern'=>'/biquwo.com/si','name'=>'Biquwo','crawl_site_articles' => true,'recommend' => false},
      '166wx' => {'pattern'=>'/166wx.net/si','name'=>'Wx166','crawl_site_articles' => true,'recommend' => false},
      'tawen' => {'pattern'=>'/tawen.com/si','name'=>'Tawen','crawl_site_articles' => true,'recommend' => false},
      'zhuaji' => {'pattern'=>'/zhuaji.org/si','name'=>'Zhuaji','crawl_site_articles' => true,'recommend' => false},
      'see3k' => {'pattern'=>'/see3k.com/si','name'=>'See3k','crawl_site_articles' => true,'recommend' => false},
      'miaobige' => {'pattern'=>'/miaobige.com/si','name'=>'Miaobige','crawl_site_articles' => true,'recommend' => false},
      'BiqugeTW' => {'pattern'=>'/www.biquge.com.tw/si','name'=>'Biqugetw','crawl_site_articles' => true,'recommend' => false},
      'qiuwu' => {'pattern'=>'/qiuwu.net/si','name'=>'Qiuwu','crawl_site_articles' => true,'recommend' => false},
      # 'bookbao' => {'pattern'=>'/bookbao.cc/si','name'=>'Bookbao','crawl_site_articles' => true,'recommend' => false},
      'kanshudown' => {'pattern'=>'/kanshudown.com/si','name'=>'Kanshudown','crawl_site_articles' => true,'recommend' => false},
      'freshcn' => {'pattern'=>'/freshcn.org/si','name'=>'Freshcn','crawl_site_articles' => true,'recommend' => false},
      'douluodalu' => {'pattern'=>'/douluodalu.com.cn/si','name'=>'Douluodalu','crawl_site_articles' => true,'recommend' => false},
      'souduOrg' => {'pattern'=>'/soudu.org/si','name'=>'Soudu','crawl_site_articles' => true,'recommend' => false},
      'rijigu' => {'pattern'=>'/book.rijigu.com/si','name'=>'BookRijigu','crawl_site_articles' => true,'recommend' => false},
      'wuruo' => {'pattern'=>'/wuruo.com/si','name'=>'Wuruo','crawl_site_articles' => true,'recommend' => false},
      '91yqw' => {'pattern'=>'/91yqw.net/si','name'=>'Yqw91','crawl_site_articles' => true,'recommend' => false},
      'lwxs520' => {'pattern'=>'/lwxs520.com/si','name'=>'Lwxs520','crawl_site_articles' => true,'recommend' => false},
      'ieyue' => {'pattern'=>'/ieyue.com/si','name'=>'Ieyue','crawl_site_articles' => true,'recommend' => false},
      'shumabaobei' => {'pattern'=>'/91baby.shumabaobei.net/si','name'=>'Shumabaobei','crawl_site_articles' => true,'recommend' => false},
      'sj133' => {'pattern'=>'/sj133.com/si','name'=>'Sj133','crawl_site_articles' => true,'recommend' => false},
      'dzdxs' => {'pattern'=>'/dzdxs.net/si','name'=>'Dzdxs','crawl_site_articles' => true,'recommend' => false},
      'wenxiu' => {'pattern'=>'/wenxiu.com/si','name'=>'Wenxiu','crawl_site_articles' => true,'recommend' => false},
      'biduge' => {'pattern'=>'/biduge.com/si','name'=>'Biduge','crawl_site_articles' => true,'recommend' => false},
      # 'linovel' => {'pattern'=>'/linovel.com/si','name'=>'Linovel','crawl_site_articles' => true,'recommend' => false},
      'motie' => {'pattern'=>'/motie.com/si','name'=>'Motie','crawl_site_articles' => true,'recommend' => false},
      'booksrc' => {'pattern'=>'/booksrc.net/si','name'=>'Booksrc','crawl_site_articles' => true,'recommend' => false},
      'sqsxs' => {'pattern'=>'/sqsxs.com/si','name'=>'Sqsxs','crawl_site_articles' => true,'recommend' => false},
      'kudu8' => {'pattern'=>'/kudu8.com/si','name'=>'Kudu8','crawl_site_articles' => true,'recommend' => false},
      'gc518' => {'pattern'=>'/gc518.com/si','name'=>'Gc518','crawl_site_articles' => true,'recommend' => false},
      'cfwx' => {'pattern'=>'/cfwx.net/si','name'=>'Cfwx','crawl_site_articles' => true,'recommend' => false},
      'biqige' => {'pattern'=>'/biqige.com/si','name'=>'Biqige','crawl_site_articles' => true,'recommend' => false},
      'daomuxiaoshuo' => {'pattern'=>'/daomuxiaoshuo.com/si','name'=>'Daomuxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      '87book' => {'pattern'=>'/87book/si','name'=>'Book87','crawl_site_articles' => true,'recommend' => false},
      # 'BookbaoCom' => {'pattern'=>'/bookbao.com/si','name'=>'BookbaoCom','crawl_site_articles' => true,'recommend' => false},
      'ixs' => {'pattern'=>'/ixs.cc/si','name'=>'Ixs','crawl_site_articles' => true,'recommend' => false},
      'x81zw' => {'pattern'=>'/x81zw.com/si','name'=>'X81zw','crawl_site_articles' => true,'recommend' => false},
      'biqugedd' => {'pattern'=>'/biqugedd.com/si','name'=>'Biqugedd','crawl_site_articles' => true,'recommend' => false},
      'yikanxiaoshuo' => {'pattern'=>'/yikanxiaoshuo.com/si','name'=>'Yikanxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      'tiannawang' => {'pattern'=>'/tiannawang.net/si','name'=>'Tiannawang','crawl_site_articles' => true,'recommend' => false},
      'xiaoshuotxt' => {'pattern'=>'/xiaoshuotxt.com/si','name'=>'Xiaoshuotxt','crawl_site_articles' => true,'recommend' => false},
      '19wx' => {'pattern'=>'/19wx.net/si','name'=>'Wx19','crawl_site_articles' => true,'recommend' => false},
      '44pq' => {'pattern'=>'/44pq.com/si','name'=>'Pq44','crawl_site_articles' => true,'recommend' => false},
      'popo' => {'pattern'=>'/popo.tw/si','name'=>'Popo','crawl_site_articles' => true,'recommend' => false},
      'xcxs' => {'pattern'=>'/xcxs.net/si','name'=>'Xcxs','crawl_site_articles' => true,'recommend' => false},
      'biqugew' => {'pattern'=>'/biqugew.net/si','name'=>'Biqugew','crawl_site_articles' => true,'recommend' => false},
      '55xs' => {'pattern'=>'/55xs.com/si','name'=>'Xs55','crawl_site_articles' => true,'recommend' => false},
      'aishu5' => {'pattern'=>'/aishu5/si','name'=>'Aishu5','crawl_site_articles' => true,'recommend' => false},
      'piaotiancc' => {'pattern'=>'/piaotian.cc/si','name'=>'Piaotiancc','crawl_site_articles' => true,'recommend' => false},
      'aiweicn' => {'pattern'=>'/aiweicn.com/si','name'=>'Aiweicn','crawl_site_articles' => true,'recommend' => false},
      'yuesesx' => {'pattern'=>'/yuesesx.com/si','name'=>'Yuesesx','crawl_site_articles' => true,'recommend' => false},
      'tiantianwx' => {'pattern'=>'/tiantianwx.com/si','name'=>'Tiantianwx','crawl_site_articles' => true,'recommend' => false},
      'shuhuangge' => {'pattern'=>'/shuhuangge.com/si','name'=>'Shuhuangge','crawl_site_articles' => true,'recommend' => false},
      'uukanshu' => {'pattern'=>'/uukanshu.com/si','name'=>'Uukanshu','crawl_site_articles' => true,'recommend' => false},
      'akxs6' => {'pattern'=>'/akxs6.com/si','name'=>'Akxs6','crawl_site_articles' => true,'recommend' => false},
      'banfusheng' => {'pattern'=>'/banfusheng.com/si','name'=>'Banfusheng','crawl_site_articles' => true,'recommend' => false},
      '66721' => {'pattern'=>'/66721.com/si','name'=>'N66721','crawl_site_articles' => true,'recommend' => false},
      '看書堂' => {'pattern'=>'/kanshutang/si','name'=>'Kanshutang','crawl_site_articles' => true,'recommend' => false},
      'lwxsw.org' => {'pattern'=>'/lwxsw.org/si','name'=>'Lwxsw','crawl_site_articles' => true,'recommend' => false},
      'zhuoguji' => {'pattern'=>'/zhuoguji/si','name'=>'Zhuoguji','crawl_site_articles' => true,'recommend' => false},
      'hhlwx' => {'pattern'=>'/hhlwx/si','name'=>'Hhlwx','crawl_site_articles' => true,'recommend' => false},
      'nsxs' => {'pattern'=>'/nsxs/si','name'=>'Nsxs','crawl_site_articles' => true,'recommend' => false},
      'shikoto' => {'pattern'=>'/shikoto/si','name'=>'Shikoto','crawl_site_articles' => true,'recommend' => false},
      'feisuzw' => {'pattern'=>'/feisuzw/si','name'=>'Feisuzw','crawl_site_articles' => true,'recommend' => false},
      'zhuisuu' => {'pattern'=>'/zhuisuu/si','name'=>'Zhuisuu','crawl_site_articles' => true,'recommend' => false},
      'nch' => {'pattern'=>'/nch.com.tw/si','name'=>'Nch','crawl_site_articles' => true,'recommend' => false},
      'danmeila' => {'pattern'=>'/danmeila.com/si','name'=>'Danmeila','crawl_site_articles' => true,'recommend' => false},
      'ty2016' => {'pattern'=>'/ty2016.net/si','name'=>'Ty2016','crawl_site_articles' => true,'recommend' => false},
      'quanben5' => {'pattern'=>'/quanben5.com/si','name'=>'Quanben5','crawl_site_articles' => true,'recommend' => false},
      'Dmzj' => {'pattern'=>'/dmzj.com/si','name'=>'Dmzj','crawl_site_articles' => true,'recommend' => false},
      'wuyanxia' => {'pattern'=>'/wuyanxia.net/si','name'=>'Wuyanxia','crawl_site_articles' => true,'recommend' => false},
      'yanqingmm' => {'pattern'=>'/yanqingmm.com/si','name'=>'Yanqingmm','crawl_site_articles' => true,'recommend' => false},
      'haxsk' => {'pattern'=>'/haxsk.com/si','name'=>'Haxsk','crawl_site_articles' => true,'recommend' => false},
      'chxiaoshuo' => {'pattern'=>'/chxiaoshuo.com/si','name'=>'Chxiaoshuo','crawl_site_articles' => true,'recommend' => false},
      '71wx.net' => {'pattern'=>'/71wx.net/si','name'=>'W71x','crawl_site_articles' => true,'recommend' => false},
      'feizw' => {'pattern'=>'/feizw.com/si','name'=>'Feizw','crawl_site_articles' => true,'recommend' => false},
      'qxswenku' => {'pattern'=>'/qxswenku.com/si','name'=>'Qxswenku','crawl_site_articles' => true,'recommend' => false},
      'read' => {'pattern'=>'/read.jd.com/si','name'=>'Readjd','crawl_site_articles' => true,'recommend' => false},
      '7ddw' => {'pattern'=>'/7ddw.com/si','name'=>'Ddw7','crawl_site_articles' => true,'recommend' => false},
      'taixuanzhanji' => {'pattern'=>'/taixuanzhanji.net/si','name'=>'Taixuanzhanji','crawl_site_articles' => true,'recommend' => false},
      '360dxs.com' => {'pattern'=>'/360dxs.com/si','name'=>'Dxs360','crawl_site_articles' => true,'recommend' => false},
      'ziyouge.com' => {'pattern'=>'/ziyouge.com/si','name'=>'Ziyouge','crawl_site_articles' => true,'recommend' => false},
      'dz88.com' => {'pattern'=>'/dz88.com/si','name'=>'Dz88','crawl_site_articles' => true,'recommend' => false},
      'suixw.com' => {'pattern'=>'/suixw.com/si','name'=>'Suixw','crawl_site_articles' => true,'recommend' => false},
      'novel8.net' => {'pattern'=>'/novel8.net/si','name'=>'Novel8','crawl_site_articles' => true,'recommend' => false},
      'jdxs' => {'pattern'=>'/jdxs.net/si','name'=>'Jdxs','crawl_site_articles' => true,'recommend' => false},
      'qb5200' => {'pattern'=>'/qb5200.com/si','name'=>'Qb5200','crawl_site_articles' => true,'recommend' => false},
      'lcread' => {'pattern'=>'/lcread.com/si','name'=>'Lcread','crawl_site_articles' => true,'recommend' => false},

      '冰火' => {'pattern'=>'/binhuo.com/si','name'=>'Binhuo','crawl_site_articles' => false,'recommend' => false},
      '91baby' => {'pattern'=>'/91baby.mama.cn/si','name'=>'Baby91','crawl_site_articles' => false,'recommend' => false},
      '衍墨轩小说网' => {'pattern'=>'/ymoxuan.com/si','name'=>'Ymoxuan','crawl_site_articles' => false,'recommend' => false},
      '万书吧' => {'pattern'=>'/wanshuba.com/si','name'=>'Wanshuba','crawl_site_articles' => false,'recommend' => false},
      '寶馬小說網' => {'pattern'=>'/baomaxs.com/si','name'=>'Baomaxs','crawl_site_articles' => false,'recommend' => false},
      '7788' => {'pattern'=>'/7788xiaoshuo.com/si','name'=>'Xiaoshuo7788','crawl_site_articles' => false,'recommend' => false},
      '螞蟻創作網' => {'pattern'=>'/antscreation.com/si','name'=>'Antscreation','crawl_site_articles' => false,'recommend' => false},
      '天天中文網' => {'pattern'=>'/ttzw365.com/si','name'=>'Ttzw365','crawl_site_articles' => false,'recommend' => false},
      '全本書庫' => {'pattern'=>'/qbshuku.com/si','name'=>'Qbshuku','crawl_site_articles' => false,'recommend' => false},
      '艳腾中文' => {'pattern'=>'/yantengzw.com/si','name'=>'Yantengzw','crawl_site_articles' => false,'recommend' => false},
      '腾讯原创' => {'pattern'=>'/book.qq.com/si','name'=>'BookQq','crawl_site_articles' => false,'recommend' => false},
      '四海网' => {'pattern'=>'/4hw.com.cn/si','name'=>'Hw4','crawl_site_articles' => false,'recommend' => false},
      '热门小说阅读' => {'pattern'=>'/52buk.com/si','name'=>'Buk52','crawl_site_articles' => false,'recommend' => false},
      '阿甘小说网' => {'pattern'=>'/8535.org/si','name'=>'Org8535','crawl_site_articles' => false,'recommend' => false},
      'u8小说' => {'pattern'=>'/u8xs.com/si','name'=>'U8xs','crawl_site_articles' => false,'recommend' => false},
      '六叶中文网' => {'pattern'=>'/6ycn.net/si','name'=>'Ycn6','crawl_site_articles' => false,'recommend' => false},
      '108小说网' => {'pattern'=>'/book108.com/si','name'=>'Book108','crawl_site_articles' => false,'recommend' => false},
      '谷粒网' => {'pattern'=>'/guli.cc/si','name'=>'Guli','crawl_site_articles' => true,'recommend' => false},
      '酷书库' => {'pattern'=>'/kushuku.com/si','name'=>'Kushuku','crawl_site_articles' => false,'recommend' => false},
      '云书阁' => {'pattern'=>'/yunshuge.com/si','name'=>'Yunshuge','crawl_site_articles' => false,'recommend' => false},
      '迪文小说网' => {'pattern'=>'/dwxs.net/si','name'=>'Dwxs','crawl_site_articles' => false,'recommend' => false},
      '燃文吧' => {'pattern'=>'/ranwenba.net/si','name'=>'Ranwenba','crawl_site_articles' => false,'recommend' => false},
      '二百五书院' => {'pattern'=>'/250sy.com/si','name'=>'Sy250','crawl_site_articles' => false,'recommend' => false},
      '天天书屋' => {'pattern'=>'/ttshu.com/si','name'=>'Ttshu','crawl_site_articles' => false,'recommend' => false}
    }
  end


  def self.get_instance url, option = {}

    @match = match_url(URI.encode(url))

    if @match.blank?
      @match = {'name' => 'NovelCrawler'}
    end

    @adapter = eval 'Crawler::'+@match['name'] + ".new"
  end

  private

    def self.match_url url
      match = nil
      CrawlerAdapter.adapter_map.each do |site, info|
        pattern = eval info['pattern']
        if pattern.match url
          puts "match pattern name:" + info['name']
          match = info
          break
        end
      end
      return match
    end
end