class AddWh2PriorityPosition < ActiveRecord::Migration
  def self.up
    add_column :priorities, :wh2_position, :integer
  end

  def self.down
    remove_column :priorities, :wh2_position
  end
end
