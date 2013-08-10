class HomeController < ApplicationController
  def index
    # @response = Instagram.media_popular
    @photo_urls = recent_instagram_images("30.2669","-97.7428")
    # binding.pry
    # @instagrams = @response.map do |item|
    #   item.images.low_resolution.url
    # end
  end

 
 private
  #Finds all recent images from instagram. Since the instagram API can be a little finicky, the method will rescue a BadRequest Error up to 5 times before giving up.
  #latitude - latitude of your location as a float
  #longitude - latitude of your location as a float
 def recent_instagram_images(latitude,longitude)
  counter = 0
  response = nil
  while counter < 5 && !response
    begin
      response = Instagram.media_search(latitude,longitude)
      puts counter += 1
    rescue Instagram::BadRequest => e
      e.inspect
    end
  end
  return response.map do |item|
    item.images.low_resolution.url
  end
end

end
