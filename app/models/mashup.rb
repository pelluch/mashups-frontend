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

  def parameters_overflow
    map_parameters[0..-5]
  end

  def parameters_overflow?
    self.parameters.count > 4
  end

  def parameters_subflow
    if parameters_overflow?
      map_parameters[-4,4]
    else
      map_parameters
    end
  end

  def map_parameters
    self.parameters.each_with_index.map { |x,i| [x, i] }
  end

  def self.default 
    Mashup.new(parameters: [], name: "untitled")
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