class PagesController < ApplicationController

  def home
    @user = User.new
    if signed_in?
    end
  end
  
end
