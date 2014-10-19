require 'active_resource'

class User < ActiveResource::Base
	self.site = "http://localhost:3000"
  # self.site = "http://api.people.com:3000"

  schema do
  	string 'name', 'password', 'email'
  end

  def authenticate
  	# Verifica al usuario
  end
end
