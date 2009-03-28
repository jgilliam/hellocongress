class Legislator < ActiveRecord::Base
  
  extend ActiveSupport::Memoizable
    
  named_scope :by_state, :order => "state asc, title desc, name asc"
  has_many :priorities, :class_name => "LegislatorPriority"
  has_many :rankings, :through => :priorities
  has_many :researches
    
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-').downcase}"
  end
  
  def name_with_title
    title + '. ' + name
  end
  
  def lastname_with_title
    title + '. ' + lastname
  end
  
  def url
    'http://' + short_name + '.' + BASE_URL + "/priorities"
  end
  
  def self.search(q)
    legislators = Legislator.find(:all, :conditions => ["name LIKE ? or fullname like ?", "%#{q}%","%#{q}%"], :order => "name desc")
    return legislators if legislators.any?
    govtrack_ids = []
    if q.length != 5 and not (q.length==10 and q[4] == '-') # they probably entered an address
      begin
        sun = Sunlight::Legislator.all_for(:address => q)
        if sun and sun.size > 0
          govtrack_ids << sun[:senior_senator].govtrack_id if sun[:senior_senator]
          govtrack_ids << sun[:junior_senator].govtrack_id if sun[:junior_senator]
          govtrack_ids << sun[:representative].govtrack_id if sun[:representative]                        
        end    
      rescue
      end        
    end
    if govtrack_ids.empty? and zip.length == 10 and zip[4] == '-' # let's try their zip9
      begin
        sun = Sunlight::Legislator.all_for(:address => q)
        if sun and sun.size > 0
          govtrack_ids << sun[:senior_senator].govtrack_id if sun[:senior_senator]
          govtrack_ids << sun[:junior_senator].govtrack_id if sun[:junior_senator]
          govtrack_ids << sun[:representative].govtrack_id if sun[:representative]                        
        end    
      rescue
      end        
    end
    if govtrack_ids.empty? # let's try their zip5, we're desperate
      sun = Sunlight::Legislator.all_in_zipcode(q[0..4])
      if sun and sun.size > 3 # only pull in their senators, need more info to pick their rep
        for s in sun
          if s.title == 'Sen'
            govtrack_ids << s.govtrack_id
          end
        end
      elsif sun and sun.size < 4
        for s in sun
          govtrack_ids << s.govtrack_id
        end
      end
    end
    if govtrack_ids.any?
      return Legislator.by_state.find(:all, :conditions => ["govtrack_id in (?)",govtrack_ids])
    else
      return []
    end
  end
  
end