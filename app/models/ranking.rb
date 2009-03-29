class Ranking < ActiveRecord::Base

  belongs_to :priority, :class_name => "LegislatorPriority"

end
