class AppsController < ApplicationController
  
  def index    
    @apps = App.order(:rank).paginate(page: params[:page], per_page: App.per_page)
  end
  
  def show
    @app = App.find(params[:id])
  end
  
end
