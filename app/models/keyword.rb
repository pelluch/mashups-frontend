require 'active_resource'

class Keyword < ActiveResource::Base
	self.site = "http://localhost:3000"
  # self.site = "http://api.people.com:3000"

  belongs_to :mashup

  schema do |t|
    t.string   "keyword"
    t.integer  "value"
    t.integer  "mashup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end