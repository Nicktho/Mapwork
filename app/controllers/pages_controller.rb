class PagesController < ApplicationController
  def index
  	@mappings = Mapping.all
  end
end
