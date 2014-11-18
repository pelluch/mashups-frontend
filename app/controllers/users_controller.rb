class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  # GET /users
  def index
    @users = Array.new
    (json_params "user/users").first.last.each do |user|
      @users << User.new(user)
    end
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create

    @user = User.new(JSON.parse HTTParty.post("http://localhost:3000/user/user_normal", :body => {user: {name: params[:user][:name], password: params[:user][:password], mail: params[:user][:mail]}}, :headers => {'Accept'=> 'application/json'}).response.body)
    
    if not defined? @user.id
      redirect_to request.referrer, notice: "Password or email are invalid " << @user.to_s
    else
      redirect_to user_path(@user.id) 
    end   
  end

  # PATCH/PUT /users/1
  def update
    #@user = JSON.parse HTTParty.put("http://localhost:3000/user/user_normal/#{params[:id]}", :body => {user: {name: 'tpgunther15'}}, :headers => {'Authorization' =>'Token token=bbdb1bb7bf7c5cae319cfdad7890fa16', 'Accept'=> 'application/json'}).response.body
    @user = User.new(json_update_user(params, params[:id]))
    if @user.id
      redirect_to user_path(@user.id), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      #@user = User.find(params[:id])
      @user = User.new(json_params "user/users/#{params[:id]}")
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :mail, :password, :password_confirmation)
    end
end
