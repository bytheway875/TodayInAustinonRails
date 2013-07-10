class HomeController < ApplicationController
  def index
    @response = Instagram.media_popular
    @instagrams = @response.map do |item|
      item.images.low_resolution.url
    end
  end
  #   counter = 0
  #   response = nil
  #   while counter < 5 && !response
  #     begin
  #       response = Instagram.media_search("30.2669","-97.7428")
  #       puts counter += 1
  #     rescue Instagram::BadRequest => e
  #       e.inspect
  #     end
  #   end
  #   @instagrams = response.map do |item|
  #     item.images.low_resolution.url
  #   end
  # end
end
