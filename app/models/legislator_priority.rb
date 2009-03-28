class LegislatorPriority < ActiveRecord::Base

  named_scope :by_score, :order => "score desc"
  named_scope :by_position, :order => "position asc"
  named_scope :no_constituents, :conditions => "constituents_count = 0"

  belongs_to :legislator
  has_many :rankings
  
  before_save :update_url
  
  # this is temp until i can figure out a clean way to expose the url from the wh2 api
  def update_url
    self.url = 'http://whitehouse2.org/priorities/' + self.wh2_id.to_s
    if self.attribute_present?("name")
      self.url += '-' + self.name.gsub(/[^a-z0-9]+/i, '-').downcase
    end
  end
  
  def status_name
    return 'failed' if obama_status == -2
    return 'compromised' if obama_status == -1
    return 'unknown' if obama_status == 0 
    return 'in the works' if obama_status == 1
    return 'successful' if obama_status == 2
  end

  def is_failed?
    obama_status == -2
  end
  
  def is_successful?
    obama_status == 2
  end
  
  def is_compromised?
    obama_status == -1
  end
  
  def is_intheworks?
    obama_status == 1
  end

end
