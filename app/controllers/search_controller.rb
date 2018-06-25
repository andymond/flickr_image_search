class SearchController < ApplicationController

  def index
    fs = FlickrService.new
    @image_urls = fs.urls(params[:search_field])
    flash[:notice] = "displaying search results for #{params[:search_field]}"
  end

end
