class SearchController < ApplicationController
  def index
     @station = Station.find_by(params[:q])
  end
end
