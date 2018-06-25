class SearchController < ApplicationController

  def index
    conn = Faraday.new
    response = conn.get("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['flickr_api_key']}&format=json&nojsoncallback=1&safe_search=1&text=kittens")
    results = JSON.parse(response.body, symbolize_names: true)
    @image_urls = results[:photos][:photo].map do |data|
      "http://farm#{data[:farm]}.static.flickr.com/#{data[:server]}/#{data[:id]}_#{data[:secret]}.jpg"
    end
    flash[:notice] = "displaying search results for #{params[:search_field]}"
  end

end
