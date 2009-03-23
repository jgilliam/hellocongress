class Priority < ActiveRecord::Base

  belongs_to :legislator
  
  before_save :update_url
  
  # this is temp until i can figure out a clean way to expose the url from the wh2 api

  def update_url
    self.url = 'http://whitehouse2.org/priorities/' + self.wh2_id.to_s
    if self.attribute_present?("name")
      self.url += '-' + self.name.gsub(/[^a-z0-9]+/i, '-').downcase
    end
  end

end
