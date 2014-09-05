 class UsersController < ApplicationController
  
  def index
    @users = User.all
    authorize! :read , @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, notice: "Signed up!"
    else
      render "new"
    end
  end
end