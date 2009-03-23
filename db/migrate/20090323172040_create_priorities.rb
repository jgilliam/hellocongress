class CreatePriorities < ActiveRecord::Migration
  def self.up
    create_table :priorities do |t|
      t.integer :legislator_id
      t.integer :wh2_id
      t.string :name, :limit => 60
      t.string :url, :limit => 150
      t.string :issues_list, :limit => 200
      t.integer :constituents_count, :default => 0, :null => :no
      t.integer :endorsers_count, :default => 0, :null => :no
      t.integer :opposers_count, :default => 0, :null => :no
      t.integer :score, :default => 0, :null => :no
      t.integer :points_count, :default => 0, :null => :no
      t.integer :documents_count, :default => 0, :null => :no
      t.integer :obama_status, :default => 0, :null => :no
      t.integer :legislator_status, :default => 0, :null => :no
      t.integer :position
      t.integer :position_24hr
      t.integer :position_24hr_change, :default => 0, :null => :no
      t.integer :position_7days
      t.integer :position_7days_change, :default => 0, :null => :no
      t.integer :position_30days
      t.integer :position_30days_change, :default => 0, :null => :no
      t.datetime :published_at
      t.datetime :crawled_at
      t.timestamps
    end
    add_index :priorities, :legislator_id
    add_index :priorities, :wh2_id
  end

  def self.down
    drop_table :priorities
  end
end
