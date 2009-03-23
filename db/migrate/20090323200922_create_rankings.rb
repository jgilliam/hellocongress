class CreateRankings < ActiveRecord::Migration
  def self.up
    create_table(:rankings,:options => "ENGINE MyISAM COLLATE utf8_unicode_ci") do |t|
      t.integer :priority_id
      t.integer :version
      t.integer :position
      t.integer :endorsers_count, :default => 0, :null => :no
      t.integer :opposers_count, :default => 0, :null => :no
      t.timestamps
    end
    add_index :rankings, [:priority_id,:version]
  end

  def self.down
    drop_table :rankings
  end
end
