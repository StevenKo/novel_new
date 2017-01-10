csv = CSV.read('a.csv', :headers=>true)
a = []
csv['name'].each do |novel_name|
  n = Novel.find_by_name(novel_name)
  if n.nil?
    p novel_name
    a << novel_name
  end 
  if n.present?
    ship = ThisWeekHotShip.new
    ship.novel = n
    ship.save
  end
end
ThisWeekHotShip.delete_all("id <= 1131")
ship = ThisWeekHotShip.new
ship.novel_id = 27928
ship.save

a = []
csv['name'].each do |novel_name|
  n = Novel.find_by_name(novel_name)
  if n.nil?
    p novel_name
    a << novel_name
  end
end

# category_recommend, hot, this_week_hot
Novel.where('is_category_recommend = 1 and category_id in (?)', [8,23,4,24,3,16,2,15,1,14]).update_all(is_category_recommend: false)

csv = CSV.read('collect.csv', :headers=>true)
a = []
csv['name'].each do |novel_name|
  n = Novel.find_by_name(novel_name)
  if n.nil?
    p novel_name
    a << novel_name
  else
    n.update_attribute(:is_category_recommend, true)
  end
end

Novel.where('is_category_this_week_hot = 1 and category_id in (?)', [2,15]).update_all(is_category_this_week_hot: false)
csv = CSV.read('allnovel.csv', :headers=>true)
a = []
csv['name'].each do |novel_name|
  n = Novel.find_by_name(novel_name)
  if n.nil?
    p novel_name
    a << novel_name
  elsif [2,15].include? n.category_id
    n.update_attribute(:is_category_this_week_hot, true) if !n.is_category_hot && !n.is_category_recommend
  end
end
Novel.where('category_id in (?)',[2,15]).order('created_at desc').limit(450).update_all(is_category_this_week_hot: true)

Novel.where('is_category_hot = 1 and category_id in (?)', [2,15]).update_all(is_category_hot: false)
csv = CSV.read('allnovel.csv', :headers=>true)
a = []
csv['name'].each do |novel_name|
  n = Novel.find_by_name(novel_name)
  if n.nil?
    p novel_name
    a << novel_name
  elsif [2,15].include? n.category_id 
    n.update_attribute(:is_category_hot, true) if !n.is_category_recommend
  end
end
