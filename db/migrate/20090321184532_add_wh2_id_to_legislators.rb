class AddWh2IdToLegislators < ActiveRecord::Migration
  def self.up
    add_column :legislators, :wh2_id, :integer
    add_index :legislators, :wh2_id
  end

  def self.down
    remove_column :legislators, :wh2_id
    remove_index :legislators, :wh2_id
  end
end
