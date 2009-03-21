namespace :wh2 do  
  
  desc "adds wh2_id to legislators.  need to run rake sunlight:legislators first to create legislators"
  task :legislators => :environment do
    current_page = 1
    for i in 1..200
      wh2legs = Wh2Legislator.find(:all, :params => { :page => current_page })
      for wh2leg in wh2legs
        leg = Legislator.find_by_govtrack_id(wh2leg.govtrack_id)
        if leg
          leg.update_attribute(:wh2_id, wh2leg.id)
          puts leg.name + ' ' + wh2leg.id.to_s
        end
      end
      if wh2legs.size > 29
        current_page += 1
      else
        break
      end
    end
  end

end