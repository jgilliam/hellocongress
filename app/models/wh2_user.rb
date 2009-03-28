class Wh2User < ActiveResource::Base
  
  extend ActiveSupport::Memoizable
    
  self.site = WH2_BASE_URL
  self.element_name = "user"

  def to_param
    "#{id}-#{login.gsub(/[^a-z0-9]+/i, '-').downcase}"
  end
  
  def url
    'http://whitehouse2.org/users/' + to_param
  end
  
  def has_picture?
    picture_id.is_a?(Integer)
  end

  def top_priority
    return nil unless top_endorsement_id
    LegislatorPriority.find_by_wh2_id(top_endorsement.priority_id)
  end
  memoize :top_priority

end
