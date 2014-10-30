class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
	helper_method :current_user

	def current_user
		@current_user = User.new(json_params "user/users/" + session[:user_id].to_s) if session[:user_id]
	end

	def json_params url
		if session[:user_id]
      		JSON.parse HTTParty.get("http://localhost:3000/#{url}", body:  {login: session[:mail]}, headers: {'Authorization' =>"Token token=#{session[:token]}", 'Accept'=>'application/json'}).response.body
  		else
  			JSON.parse HTTParty.get("http://localhost:3000/#{url}", headers: {'Accept'=>'application/json'}).response.body
  		end
  	end

  	def json_update_mashup id, params
  		JSON.parse HTTParty.put("http://localhost:3000/mashup/mashups/#{id}", :body => {mashup: params, login: session[:mail]}, :headers => {'Authorization' =>"Token token=#{current_user.token}", 'Accept'=> 'application/json'}).response.body
  	end

  	def json_create_mashup
  		JSON.parse HTTParty.post("http://localhost:3000/mashup/mashups/", :body => {login: session[:mail]}, :headers => {'Authorization' =>"Token token=#{current_user.token}", 'Accept'=> 'application/json'}).response.body
  	end

  	def json_destroy_mashup mashup_id
  		JSON.parse HTTParty.delete("http://localhost:3000/mashup/mashups/#{mashup_id}", :body => {login: session[:mail]}, :headers => {'Authorization' =>"Token token=#{current_user.token}", 'Accept'=> 'application/json'}).response.body
  	end

end
