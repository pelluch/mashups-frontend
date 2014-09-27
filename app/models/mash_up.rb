require 'active_resource'

class MashUp < ActiveResource::Base
	self.site = "#"
  # self.site = "http://api.people.com:3000"

  def search
  	#Incluye un termino a la busqueda
  end

  def rollBackSearch
  	#Elimina ultimo termino de la busqueda
  end

  def cloudTag
  	#Obtiene cloudTag a partir de los atributos en un formato presentable
  end

end