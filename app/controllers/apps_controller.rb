class AppsController < ApplicationController
  
  def index  
    @search = App.search do  
      fulltext params[:search]
      paginate per_page: App.per_page
    end  
    @apps = @search.results
  end
  
  def show
    @app = App.find(params[:id])
  end
  
end
