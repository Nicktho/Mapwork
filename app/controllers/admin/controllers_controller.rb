class Admin::ControllersController < ApplicationController
  before_action :check_admin
  def index
    @controllers = Controller.all
  end

  def create
    @controller = Controller.new controller_params
    if @controller.save
      redirect_to admin_controllers_path
    else 
      render :new
    end 
  end

  def new
    @controller = Controller.new
  end

  def edit
    @controller = Controller.find params[:id]
  end

  def show
  end

  def update
    @controller = Controller.find params[:id]
    if @controller.update controller_params
      redirect_to admin_controllers_path
    else 
      render :edit
    end
  end

  def destroy
    controller = Controller.find params[:id]
    controller.destroy
    redirect_to admin_controllers_path
  end

  private
  def check_admin
    redirect_to root_path unless @current_user[:admin]
  end 

  def controller_params
    params.require(:c).permit(:name, :avatar)
  end 
end
