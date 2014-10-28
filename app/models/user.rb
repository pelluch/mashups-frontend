require 'active_resource'

class User < ActiveResource::Base

	self.site = "http://localhost:3000"
  # self.site = "http://api.people.com:3000"

  has_many :mashups

  schema do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "password_digest"
    t.string   "token"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  


  
end
