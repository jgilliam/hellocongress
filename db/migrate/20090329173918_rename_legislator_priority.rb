class RenameLegislatorPriority < ActiveRecord::Migration
  def self.up
    rename_column :rankings, :priority_id, :legislator_priority_id
  end

  def self.down
  end
end
