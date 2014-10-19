require 'active_resource'

class User < ActiveResource::Base
	self.site = "http://localhost:3000"
  # self.site = "http://api.people.com:3000"
  def authenticate
  	# Verifica al usuario
  end
end
