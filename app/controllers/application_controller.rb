class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :recent_instagram_images
  require 'instagram'
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
