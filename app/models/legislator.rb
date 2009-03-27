class Legislator < ActiveRecord::Base
  
  extend ActiveSupport::Memoizable
    
  named_scope :by_state, :order => "state asc, title desc, name asc"
  has_many :priorities
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
  
end