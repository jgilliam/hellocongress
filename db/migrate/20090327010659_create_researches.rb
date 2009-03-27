class CreateResearches < ActiveRecord::Migration
  def self.up
    create_table :researches do |t|
      t.integer :wh2_id
      t.integer :legislator_id
      t.integer :issue_id
      t.boolean :is_legislator, :default => 0, :null => :no
      t.string :name, :limit => 60
      t.string :requester, :limit => 100
      t.string :organization, :limit => 100
      t.string :email, :limit => 100
      t.string :url, :limit => 150
      t.text :content
      t.timestamps
    end
    add_index :researches, :wh2_id
    add_index :researches, :legislator_id
    add_index :researches, :issue_id 
  end

  def self.down
    drop_table :researches
  end
end
