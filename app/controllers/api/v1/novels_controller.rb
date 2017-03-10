class Api::V1::NovelsController < Api::ApiController

  def new_uploaded_novels
    params[:page] ||= 1
    render_cached_json("api:new_uploaded_novels:#{params[:page]}", expires_in: 1.hour) do
      novels = Novel.show.select("id,name,author,pic,article_num,last_update,is_serializing").order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
    end
  end

  def recommend_category_novels
    render_cached_json("api:recommend_category_novels:#{params[:recommend_category_id]}", expires_in: 1.hour) do
      category_id = params[:recommend_category_id]
      category = RecommendCategory.find(category_id)
      novels = category.novels.select("novels.id,name,author,pic,article_num,last_update,is_serializing").shuffle
    end
  end

  def collect_novels_info
    novels_id = params[:novels_id]
    novels = Novel.where("id in (#{novels_id})").select("id,name,author,pic,article_num,last_update,is_serializing")
    render :json => novels
  end

  def index
    params[:page] ||= 1
    category_id = params[:category_id]
    unless category_id == "13"
      render_cached_json("api:index13:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        categoryies_id = find_same_set_ids(category_id)
        novels = Novel.where('category_id in (?)', categoryies_id).show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50)
      end
    else
      render_cached_json("api:index:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        novels = Novel.where('is_serializing = false').show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50)
      end
    end
  end

  def show
    render_cached_json("api:show:#{params[:id]}", expires_in: 1.hour) do
      novel = Novel.find(params[:id])
    end
  end

  def category_hot
    params[:page] ||= 1
    category_id = params[:category_id]
    unless category_id == "13"
      render_cached_json("api:category_hot13:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        categoryies_id = find_same_set_ids(category_id)
        novels = Novel.where('category_id in (?) and is_category_hot = true', categoryies_id).show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50).order("updated_at DESC")
      end
    else
      render_cached_json("api:category_hot:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        novels = Novel.where('is_serializing = false and is_category_hot = true').show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50).order("updated_at DESC")
      end
    end
  end

  def category_this_week_hot
    params[:page] ||= 1
    category_id = params[:category_id]
    unless category_id == "13"
      render_cached_json("api:category_this_week_hot13:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        categoryies_id = find_same_set_ids(category_id)
        novels = Novel.where('category_id in (?) and is_category_this_week_hot = true', categoryies_id).show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50).order("updated_at DESC")
      end
    else
      render_cached_json("api:category_this_week_hot:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        novels = Novel.where('is_serializing = false and is_category_this_week_hot = true').show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50).order("updated_at DESC")
      end
    end
  end

  def category_recommend
    params[:page] ||= 1
    category_id = params[:category_id]
    unless category_id == "13"
      render_cached_json("api:category_recommend13:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        categoryies_id = find_same_set_ids(category_id)
        novels = Novel.where('category_id in (?) and is_category_recommend = true', categoryies_id).show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50).order("updated_at DESC")
      end
    else
      render_cached_json("api:category_recommend:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        novels = Novel.where('is_serializing = false and is_category_recommend = true').show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50).order("updated_at DESC")
      end
    end
  end

  def category_latest_update
    params[:page] ||= 1
    category_id = params[:category_id]
    unless category_id == "13"
      render_cached_json("api:category_latest_update13:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        categoryies_id = find_same_set_ids(category_id)
        novels = Novel.where('category_id in (?)', categoryies_id).show.select("id,name,author,pic,article_num,last_update,is_serializing").order("updated_at DESC").paginate(:page => params[:page], :per_page => 50)
      end
    else
      render_cached_json("api:category_latest_update:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
        novels = Novel.where('is_serializing = false').order("updated_at DESC").show.select("id,name,author,pic,article_num,last_update,is_serializing").paginate(:page => params[:page], :per_page => 50)
      end
    end
  end

  def category_finish
    params[:page] ||= 1
    category_id = params[:category_id]
    render_cached_json("api:category_finish:#{params[:page]}:#{params[:category_id]}", expires_in: 1.hour) do
      categoryies_id = find_same_set_ids(category_id)
      novels = Novel.where('is_serializing = false and category_id in (?)', categoryies_id).show.select("id,name,author,pic,article_num,last_update,is_serializing").order("updated_at DESC").paginate(:page => params[:page], :per_page => 50)
    end
  end

  def hot
    params[:page] ||= 1
    render_cached_json("api:hot:#{params[:page]}", expires_in: 1.hour) do
      novels_id = HotShip.paginate(:page => params[:page], :per_page => 30).map{|ship| ship.novel_id}.join(',')
      novels = Novel.where("id in (#{novels_id})").show.select("id,name,author,pic,article_num,last_update,is_serializing").order("updated_at DESC").shuffle
    end
  end

  def this_week_hot
    params[:page] ||= 1
    render_cached_json("api:this_week_hot:#{params[:page]}", expires_in: 1.hour) do
      novels_id = ThisWeekHotShip.paginate(:page => params[:page], :per_page => 30).map{|ship| ship.novel_id}.join(',')
      novels = Novel.where("id in (#{novels_id})").show.select("id,name,author,pic,article_num,last_update,is_serializing").order("updated_at DESC").shuffle
    end
  end

  def this_month_hot
    params[:page] ||= 1
    render_cached_json("api:this_month_hot:#{params[:page]}", expires_in: 1.hour) do
      novels_id = ThisMonthHotShip.paginate(:page => params[:page], :per_page => 30).map{|ship| ship.novel_id}.join(',')
      novels = Novel.where("id in (#{novels_id})").show.select("id,name,author,pic,article_num,last_update,is_serializing").order("updated_at DESC").shuffle
    end
  end

  def all_novel_update
    params[:page] ||= 1
    render_cached_json("api:all_novel_update_new:#{params[:page]}", expires_in: 1.hour) do
      novels = Novel.show.select("id,name,author,pic,article_num,last_update,is_serializing").order("updated_at DESC").paginate(:page => params[:page], :per_page => 50)
    end
  end

  def search
    keyword = params[:search].strip
    keyword_cn = keyword.clone
    keyword_cn = ZhConv.convert("zh-tw",keyword_cn,false)
    novels = Novel.where("name like ? or author like ? or name like ? or author like ?", "%#{keyword}%","%#{keyword}%","%#{keyword_cn}%","%#{keyword_cn}%").show.select("id,name,author,pic,article_num,last_update,is_serializing")
    render :json => novels
  end

  def elastic_search
    keyword = params[:search].strip
    keyword_cn = keyword.clone
    keyword_cn = ZhConv.convert("zh-tw",keyword_cn,false)
    results_ids = Novel.search(keyword_cn).per_page(20).page(params[:page]).map(&:id)
    render :json => Novel.select("id,name,author,pic,article_num,last_update,is_serializing").where(is_show: true).find_in_order(results_ids)
  end

  def detail_for_save
    @novel = Novel.find(params[:id])
    render :json => { "novel" =>  @novel }
    # @articles = Article.where("novel_id = #{@novel.id}").select("id, subject, title")
  end

  
  def classic
    novels = Novel.where('is_classic = true').show.select("id,name,author,pic,article_num,last_update,is_serializing")
    render :json => novels
  end

  def classic_action
    novels = Novel.where('is_classic_action = true').show.select("id,name,author,pic,article_num,last_update,is_serializing")
    render :json => novels
  end

private
  def find_same_set_ids(category_id)
    case category_id
    when "14"
      [1,14]
    when "15"
      [2,15]
    when "16"
      [3,16]
    when "17"
      [9,17]
    when "18"
      [7,18]
    when "19"
      [5,19]
    when "20"
      [6,20]
    when "21"
      [21]
    when "22"
      [22,12]
    when "23"
      [8,23]
    when "24"
      [4,24]
    else
      [category_id.to_i]
    end
  end
end
