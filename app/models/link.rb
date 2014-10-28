require 'active_resource'

class Link < ActiveResource::Base
	self.site = "http://localhost:3000"
  # self.site = "http://api.people.com:3000"

  belongs_to :mashups
  belongs_to :link_source

  schema do |t|
    t.integer  "value"
    t.string   "link"
    t.string   "title"
    t.integer  "mashup_id"
    t.integer  "link_source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
