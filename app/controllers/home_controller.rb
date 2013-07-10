class HomeController < ApplicationController
  def index
    @response = Instagram.media_popular
    # @response = recent_instagram_images("30.2669","-97.7428")
    @instagrams = @response.map do |item|
      item.images.low_resolution.url
    end
  end
 



 
 private

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
