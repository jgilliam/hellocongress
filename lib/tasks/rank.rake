namespace :rank do  
  
  desc "ranks the priorities for each legislator"
  task :priorities => :environment do

    v = 1    
    if highest_version = Ranking.maximum(:version)
      v = highest_version.version+1 || 1 
    end
    
    for legislator in Legislator.all
      
      r = legislator.rankings.maximum(:version, :conditions => "rankings.created_at < date_add(now(), INTERVAL -1 DAY)")
      v_24hr = 0
      v_24hr = r.version if r
      r = legislator.rankings.maximum(:version, :conditions => "rankings.created_at < date_add(now(), INTERVAL -7 DAY)")
      v_7days = 0
      v_7days = r.version if r
      r = legislator.rankings.maximum(:version, :conditions => "rankings.created_at < date_add(now(), INTERVAL -30 DAY)")
      v_30days = 0
      v_30days = r.version if r     
        
      for p in legislator.priorities.by_score
        r = p.rankings.find_by_version(v_24hr)
        if r # in that version
          p.position_24hr = r.position
          p.position_24hr_change = p.position_24hr - p.position     
        else # didn't exist yet
          p.position_24hr = 0
          p.position_24hr_change = 0
        end   
      
        r = p.rankings.find_by_version(v_7days)
        if r # in that version
          p.position_7days = r.position
          p.position_7days_change = p.position_7days - p.position     
        else # didn't exist yet
          p.position_7days = 0
          p.position_7days_change = 0
        end   
    
        r = p.rankings.find_by_version(v_30days)
        if r # in that version
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