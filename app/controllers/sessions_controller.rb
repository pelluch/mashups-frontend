class SessionsController < ApplicationController
  def new
  end

  def create
  user = authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to root_url, :notice => session[:user_id].to_s + "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
	session[:user_id]=nil
	redirect_to root_url, :notice => "Logged out!"
end

private

def users_all
  users = Array.new
  (json_params "user/users").first.last.each do |user|
    users << User.new(user)
  end
  users
end

def authenticate (mail, password)
  user = User.new
  users_all.each do |u|
    #verificar tokens por que manda password_digest pero no password
    user = u if u.mail == mail
  end 

    if user
      user
    end
  end

end
