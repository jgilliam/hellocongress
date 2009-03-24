class AddShortNameToLegislator < ActiveRecord::Migration
  def self.up
    add_column :legislators, :short_name, :string, :limit => 30
    add_index :legislators, :short_name
  end

  def self.down
  end
end
