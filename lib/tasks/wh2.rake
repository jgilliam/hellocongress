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
  
  desc "crawls wh2 for the constituent priorities of each legislator.  this should be run regularly, every hour or day"
  task :priorities => :environment do
    for legislator in Legislator.all
      wh2leg = Wh2Legislator.find(legislator.wh2_id)
      wh2priorities = wh2leg.get(:constituent_priorities)
      position = 0
      for wh2priority in wh2priorities
        position += 1
        priority = Priority.find_or_create_by_legislator_id_and_wh2_id(legislator.id,wh2priority["priority"]["id"])
        priority.name = wh2priority["priority"]["name"]
        priority.issues_list = wh2priority["priority"]["cached_issue_list"]
        priority.position = position
        priority.score = wh2priority["score"].to_i
        priority.constituents_count = wh2priority["endorsers_count"].to_i+wh2priority["opposers_count"].to_i
        priority.endorsers_count = wh2priority["endorsers_count"]
        priority.opposers_count = wh2priority["opposers_count"]
        priority.points_count = wh2priority["priority"]["points_count"]
        priority.documents_count = wh2priority["priority"]["documents_count"]
        priority.obama_status = wh2priority["priority"]["obama_status"]
        priority.wh2_position = wh2priority["priority"]["position"]
        priority.published_at = Time.now unless priority.attribute_present?("published_at")
        priority.crawled_at = Time.now
        priority.save
      end
    end
  end

end
