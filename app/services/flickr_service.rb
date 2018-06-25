class FlickrService

  def initialize
    @conn = Faraday.new
  end

  def urls(search_term)
    url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['flickr_api_key']}&format=json&nojsoncallback=1&safe_search=1&text=#{search_term}"
    results = get_json(url)
    results[:photos][:photo].map do |data|
      "http://farm#{data[:farm]}.static.flickr.com/#{data[:server]}/#{data[:id]}_#{data[:secret]}.jpg"
    end
  end

  private

    def get_json(url)
      response = @conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
