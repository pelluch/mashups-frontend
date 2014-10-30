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
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: 'Signed Up!'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.new(user_params)
    if @user.update
      redirect_to @user, notice: 'User was successfully updated.'
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
      params[:user]
    end
end
