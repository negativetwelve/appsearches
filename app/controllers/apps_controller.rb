class AppsController < ApplicationController
  
  def index
    if params[:search].nil? || params[:search].empty?
      @apps = App.paginate(page: params[:page], per_page: App.per_page)
    else
      @apps = App.search_test(params[:search]).paginate(page: params[:page], per_page: App.per_page)
    end
  end
  
  def show
    @app = App.find(params[:id])
  end
  
end
