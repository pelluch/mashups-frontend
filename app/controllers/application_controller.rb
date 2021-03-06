class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
	helper_method :current_user

	def current_user
		begin
      @current_user = User.new(json_params "user/users/" + session[:user_id].to_s) if session[:user_id]
    rescue Exception => e
    session[:user_id]=nil
    session[:mail]=nil
    session[:token]=nil
      nil
    end
	end

	def json_params url
		if session[:user_id]
      logger.info "http://localhost:3000/#{url}"
   		JSON.parse HTTParty.get("http://localhost:3000/#{url}", body:  {login: session[:mail]}, headers: {'Authorization' =>"Token token=#{session[:token]}", 'Accept'=>'application/json'}).response.body
  	else
  		JSON.parse HTTParty.get("http://localhost:3000/#{url}", headers: {'Accept'=>'application/json'}).response.body
  	end
  end

  def json_update_user params, id
    JSON.parse HTTParty.put("http://localhost:3000/user/user_normal/#{id}", :body => {user: {name: params[:user][:name], password: params[:user][:password], mail: params[:user][:mail]}}, :headers => {'Authorization' =>"Token token=#{current_user.token}",'Accept'=> 'application/json'}).response.body
  end

  def json_update_mashup params
    JSON.parse HTTParty.put("http://localhost:3000/mashup/mashups", :body => {parameters: params[:parameters], sources: params[:sources], login: session[:mail]}, :headers => {'Authorization' =>"Token token=#{current_user.token}", 'Accept'=> 'application/json'}).response.body
  end

	def json_create_mashup name
		JSON.parse HTTParty.post("http://localhost:3000/mashup/mashups/", :body => {login: session[:mail], name: name}, :headers => {'Authorization' =>"Token token=#{current_user.token}", 'Accept'=> 'application/json'}).response.body
	end

	def json_destroy_mashup mashup_id
		JSON.parse HTTParty.delete("http://localhost:3000/mashup/mashups/#{mashup_id}", :body => {login: session[:mail]}, :headers => {'Authorization' =>"Token token=#{current_user.token}", 'Accept'=> 'application/json'}).response.body
	end

  def sources
    sources = JSON.parse HTTParty.get("http://localhost:3000/mashup/sources", :headers => {'Accept'=> 'application/json'}).response.body

    @sources = Array.new
    sources["sources"].each do |a|
      s = LinkSource.new name: a["name"], photo: a["photo"]
      @sources << s
    end
    @sources
  end

end
