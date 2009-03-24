class Wh2User < ActiveResource::Base
  
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

end
