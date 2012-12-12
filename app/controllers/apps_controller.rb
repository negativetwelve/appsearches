class AppsController < ApplicationController
  
  def index
    if params[:type].try(:downcase) == "free"
      @apps = App.top.free.order(:rank).paginate(page: params[:page], per_page: App.per_page)
    elsif params[:type].try(:downcase) == "paid"
      @apps = App.top.paid.order(:rank).paginate(page: params[:page], per_page: App.per_page)
    elsif params[:search]
      @apps = App.search(params[:search]).paginate(page: params[:page], per_page: App.per_page)
      if @apps.empty?
        render 'apps/no_search_results'
      end
    elsif params[:fuzzy_search]
      
    elsif params[:artist_id]
      @seller_name = App.find_by_artist_id(params[:artist_id]).seller_name
      @apps = App.where(artist_id: params[:artist_id].to_i).paginate(page: params[:page], per_page: App.per_page)
      render 'apps/seller'
    else
      @apps = App.paginate(page: params[:page], per_page: App.per_page)
    end
  end
  
  def show
    @app = App.find(params[:id])
  end
  
end
