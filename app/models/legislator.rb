class Legislator < ActiveRecord::Base
  
  named_scope :by_state, :order => "state asc, title desc, name asc"
  has_many :priorities
  has_many :rankings, :through => :priorities
  
  def name_with_title
    title + '. ' + name
  end
  
  def lastname_with_title
    title + '. ' + lastname
  end
  
end