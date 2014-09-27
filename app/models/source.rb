require 'active_resource'

class Source < ActiveResource::Base
	self.site = "#"
  # self.site = "http://api.people.com:3000"
end