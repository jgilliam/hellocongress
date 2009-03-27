class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.integer :wh2_id
      t.string :name, :limit => 60
      t.integer :opposers_count, :default => 0, :null => :no
      t.integer :endorsers_count, :default => 0, :null => :no
      t.integer :priorities_count, :default => 0, :null => :no
      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
