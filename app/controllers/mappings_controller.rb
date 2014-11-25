class MappingsController < ApplicationController
  def index
    @mappings = Mapping.includes(:controller, :software, :user).all

    if id = params[:user_id]
      @mappings = @mappings.where(user_id: id)
      @user = User.find id
    end 
    if controller = params[:controller_id] and !controller.empty?
      @mappings = @mappings.where(controller_id: controller)
    end 
    if software = params[:software_id] and !software.empty?
      @mappings = @mappings.where(software_id: software)
    end 


    @mappings = case params[:sort]
      when "top" then @mappings.top_downloads
      when "recent" then @mappings.recent
      when "rated"
       @mappings.highest_rated
      else @mappings
    end 

  end

  def create
    @user = User.find params[:user_id]
    @mapping = Mapping.new mapping_params
    @mapping.user = @user
    if @mapping.save 
      redirect_to mapping_path @mapping
    else 

      render :new
    end 
  end

  def new
    redirect_to root_path unless @current_user
    @user = @current_user
    @mapping = Mapping.new
  end

  def edit
    @user = @current_user
  end

  def show
    @mapping = Mapping.includes(:user, :software, :controller, :images).find(params[:id])
  end

  def update
  end

  def destroy
  end

  def upvote
    @mapping = Mapping.find params[:id]
    @mapping.upvote
    redirect_to mapping_path @mapping
  end 

  def downvote 
    @mapping = Mapping.find params[:id]
    @mapping.downvote
    redirect_to mapping_path @mapping
  end 

  def download
    @mapping = Mapping.find params[:id]
    @mapping.download
    redirect_to @mapping.url 
  end 

  private
  def mapping_params
    params.require(:mapping).permit(:controller_id, :software_id, :name, :description, :video, :url, :user_id)
  end 
end
