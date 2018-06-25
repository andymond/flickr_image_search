require 'rails_helper'

describe "FlickrService" do
  it "requests from flickr api & generates image urls from results" do
    fs = FlickerService.new
    urls = fs.urls('cats')

    expect(urls).to be_an("Array")
    expect(urls[0]).to include("http://farm")
    expect(urls[0]).to include(".static.flickr.com/")
  end
end
