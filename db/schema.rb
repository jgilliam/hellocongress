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

ActiveRecord::Schema.define(:version => 20090320200328) do

  create_table "legislators", :force => true do |t|
    t.string   "type",               :limit => 25
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
  end

  add_index "legislators", ["name"], :name => "index_legislators_on_name"

end
