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