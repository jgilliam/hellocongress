class Issue < ActiveRecord::Base
  
  named_scope :alphabetical, :order => "name asc"
  named_scope :more_than_three_priorities, :conditions => "priorities_count > 3"

  has_many :researches
  
end
