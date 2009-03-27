# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090327010659) do

  create_table "issues", :force => true do |t|
    t.integer  "wh2_id"
    t.string   "name",             :limit => 60
    t.integer  "opposers_count",                 :default => 0
    t.integer  "endorsers_count",                :default => 0
    t.integer  "priorities_count",               :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legislators", :force => true do |t|
    t.string   "name",               :limit => 100
    t.string   "fullname",           :limit => 100
    t.string   "nickname",           :limit => 30
    t.string   "title",              :limit => 10
    t.string   "firstname",          :limit => 60
    t.string   "middlename",         :limit => 20
    t.string   "lastname",           :limit => 60
    t.string   "name_suffix",        :limit => 5
    t.string   "gender",             :limit => 1
    t.string   "congress_office",    :limit => 200
    t.string   "party",              :limit => 1
    t.string   "state",              :limit => 2
    t.string   "district",           :limit => 15
    t.string   "senate_class",       :limit => 10
    t.boolean  "in_office",                         :default => true
    t.integer  "govtrack_id"
    t.integer  "votesmart_id"
    t.string   "fec_id",             :limit => 10
    t.string   "crp_id",             :limit => 10
    t.string   "bioguide_id",        :limit => 10
    t.string   "phone",              :limit => 20
    t.string   "fax",                :limit => 20
    t.string   "email",              :limit => 80
    t.string   "webform",            :limit => 100
    t.string   "website",            :limit => 100
    t.string   "twitter_id",         :limit => 20
    t.string   "congresspedia_url",  :limit => 100
    t.string   "youtube_url",        :limit => 50
    t.integer  "constituents_count",                :default => 0
    t.datetime "last_crawled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wh2_id"
    t.string   "short_name",         :limit => 30
  end

  add_index "legislators", ["name"], :name => "index_legislators_on_name"
  add_index "legislators", ["short_name"], :name => "index_legislators_on_short_name"
  add_index "legislators", ["wh2_id"], :name => "index_legislators_on_wh2_id"

  create_table "priorities", :force => true do |t|
    t.integer  "legislator_id"
    t.integer  "wh2_id"
    t.string   "name",                   :limit => 60
    t.string   "url",                    :limit => 150
    t.string   "issues_list",            :limit => 200
    t.integer  "constituents_count",                    :default => 0
    t.integer  "endorsers_count",                       :default => 0
    t.integer  "opposers_count",                        :default => 0
    t.integer  "score",                                 :default => 0
    t.integer  "points_count",                          :default => 0
    t.integer  "documents_count",                       :default => 0
    t.integer  "obama_status",                          :default => 0
    t.integer  "legislator_status",                     :default => 0
    t.integer  "position"
    t.integer  "position_24hr"
    t.integer  "position_24hr_change",                  :default => 0
    t.integer  "position_7days"
    t.integer  "position_7days_change",                 :default => 0
    t.integer  "position_30days"
    t.integer  "position_30days_change",                :default => 0
    t.datetime "published_at"
    t.datetime "crawled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wh2_position"
  end

  add_index "priorities", ["legislator_id"], :name => "index_priorities_on_legislator_id"
  add_index "priorities", ["wh2_id"], :name => "index_priorities_on_wh2_id"

  create_table "rankings", :force => true do |t|
    t.integer  "priority_id"
    t.integer  "version"
    t.integer  "position"
    t.integer  "endorsers_count", :default => 0
    t.integer  "opposers_count",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rankings", ["priority_id", "version"], :name => "index_rankings_on_priority_id_and_version"

  create_table "researches", :force => true do |t|
    t.integer  "wh2_id"
    t.integer  "legislator_id"
    t.integer  "issue_id"
    t.boolean  "is_legislator",                :default => false
    t.string   "name",          :limit => 60
    t.string   "requester",     :limit => 100
    t.string   "organization",  :limit => 100
    t.string   "email",         :limit => 100
    t.string   "url",           :limit => 150
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "researches", ["issue_id"], :name => "index_researches_on_issue_id"
  add_index "researches", ["legislator_id"], :name => "index_researches_on_legislator_id"
  add_index "researches", ["wh2_id"], :name => "index_researches_on_wh2_id"

end
