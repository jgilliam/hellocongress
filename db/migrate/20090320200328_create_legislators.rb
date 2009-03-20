class CreateLegislators < ActiveRecord::Migration
  def self.up
    create_table :legislators do |t|
      t.string :name, :limit => 100       
      t.string :fullname, :limit => 100     
      t.string :nickname, :limit => 30      
      t.string :title, :limit => 10      
      t.string :firstname, :limit => 60
      t.string :middlename, :limit => 20      
      t.string :lastname, :limit => 60 
      t.string :name_suffix, :limit => 5
      t.string :gender, :limit => 1      
      t.string :congress_office, :limit => 200      
      
      t.string :party, :limit => 1
      t.string :state, :limit => 2      
      t.string :district, :limit => 15
      t.string :senate_class, :limit => 10
      t.boolean :in_office, :default => 1, :null => :no
            
      t.integer :govtrack_id
      t.integer :votesmart_id      
      t.string :fec_id, :limit => 10
      t.string :crp_id, :limit => 10
      t.string :bioguide_id, :limit => 10      

      t.string :phone, :limit => 20
      t.string :fax, :limit => 20   
      t.string :email, :limit => 80
      t.string :webform, :limit => 100       
      t.string :website, :limit => 100
            
      t.string :twitter_id, :limit => 20        
      t.string :congresspedia_url, :limit => 100
      t.string :youtube_url, :limit => 50  
          
      t.integer :constituents_count, :default => 0, :null => :no
      t.datetime :last_crawled_at
      t.timestamps
    end
    add_index :legislators, :name
  end

  def self.down
    drop_table :legislators
  end
end
