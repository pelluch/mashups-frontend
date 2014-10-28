class SessionsController < ApplicationController
  def new
  end

  def create
  user = authenticate(params[:mail], params[:password])
  if user
    session[:user_id] = user.first.id
    redirect_to root_url, :notice => "Logged in!"
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
def authenticate (mail, password)
    user= User.find(:all, :params => {:password=>password, :mail => mail})

    if user
      user
    end
  end

end
