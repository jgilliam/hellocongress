namespace :rank do  
  
  desc "ranks the priorities for each legislator"
  task :priorities => :environment do

    highest_version = Ranking.maximum(:version)
    v = (highest_version || 0)+1
    
    for legislator in Legislator.all
      
      v_24hr = legislator.rankings.maximum(:version, :conditions => "rankings.created_at < date_add(now(), INTERVAL -1 DAY)")
      v_7days = legislator.rankings.maximum(:version, :conditions => "rankings.created_at < date_add(now(), INTERVAL -7 DAY)")
      v_30days = legislator.rankings.maximum(:version, :conditions => "rankings.created_at < date_add(now(), INTERVAL -30 DAY)")
        
      for p in legislator.priorities.by_score
        
        if v_24hr and r = p.rankings.find_by_version(v_24hr) # in that version
          p.position_24hr = r.position
          p.position_24hr_change = p.position_24hr - p.position     
        else # didn't exist yet
          p.position_24hr = 0
          p.position_24hr_change = 0
        end   
      
        if v_7days and r = p.rankings.find_by_version(v_7days) # in that version
          p.position_7days = r.position
          p.position_7days_change = p.position_7days - p.position     
        else # didn't exist yet
          p.position_7days = 0
          p.position_7days_change = 0
        end   
    
        
        if v_30days and r = p.rankings.find_by_version(v_30days) # in that version
          p.position_30days = r.position
          p.position_30days_change = p.position_30days - p.position     
        else # didn't exist yet
          p.position_30days = 0
          p.position_30days_change = 0
        end    
    
        p.save_with_validation(false)
        p.rankings.create(:version => v, :position => p.position, :endorsers_count => p.endorsers_count, :opposers_count => p.opposers_count)
        
      end
      
    end
  end
  
end