class Ranking < ActiveRecord::Base

  belongs_to :priority, :class_name => "LegislatorPriority", :foreign_key => "priority_id"

end
