require 'active_resource'

class User < ActiveResource::Base
	self.site = "#"
  # self.site = "http://api.people.com:3000"
  def authenticate
  	# Verifica al usuario
  end
end
