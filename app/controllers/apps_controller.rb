class AppsController < ApplicationController
  
  def index
    if params[:type].try(:downcase) == "free"
      @apps = App.where(formatted_price: "Free").order(:rank)
    elsif params[:type].try(:downcase) == "paid"
      @apps = App.where("formatted_price != 'Free'").order(:rank)
    elsif params[:search]
      @apps = App.search(params[:search])
      if @apps.empty?
        render 'apps/no_search_results'
      end
    else
      @apps = App
    end
    @apps = @apps.paginate(page: params[:page], per_page: App.per_page)
  end
  
  def show
    @app = App.find(params[:id])
  end
  
end
