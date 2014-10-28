require 'active_resource'

class Mashup < ActiveResource::Base
	self.site = "http://localhost:3000"
  # self.site = "http://api.people.com:3000"

  belongs_to :user
  has_many :links
  has_many :keywords

  schema do |t|
    t.string   "parameters"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  def params
    self.parameters.split(' ')
  end

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