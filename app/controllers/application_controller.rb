class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
	helper_method :current_user

	def current_user
		@current_user = User.new(json_params "user/users/"+session[:user_id].to_s) if session[:user_id]
	end

	def json_params url
      JSON.parse HTTParty.get("http://localhost:3000/#{url}", body:  {login: 'mail1@mail.com'}, headers: {'Accept'=>'application/json'}).response.body
  	end
end
