class UsersController < ApplicationController
  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path
    else
      render :new
    end 
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
    redirect_to root_path unless @current_user == @user
  end

  def show  
    @user = User.includes(:mappings).find params[:id]
    @total_downloads = @user.total_downloads
  end

  def update
    @user = User.find params[:id]
    redirect_to root_path unless @current_user == @user
    if @user.update user_params
      redirect_to user_path @user
    else
      render :edit
    end 
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end 
end
