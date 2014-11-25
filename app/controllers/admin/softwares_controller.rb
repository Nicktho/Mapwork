class Admin::SoftwaresController < ApplicationController
  before_action :check_admin
  def index
    @softwares = Software.all
  end

  def create
    @software = Software.new software_params
    if @software.save
      redirect_to admin_softwares_path
    else 
      render :new
    end 
  end

  def new
    @software = Software.new
  end

  def edit
    @software = Software.find params[:id]
  end

  def update
    @software = Software.find params[:id]
    if @software.update software_params
      redirect_to admin_softwares_path
    else 
      render :edit
    end
  end

  def destroy
    software = Software.find params[:id]
    software.destroy
    redirect_to admin_softwares_path
  end

  private
  def check_admin
    redirect_to root_path unless @current_user[:admin]
  end 

  def software_params
    params.require(:software).permit(:name)
  end 
end
