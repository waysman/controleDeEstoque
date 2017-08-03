class ApplicationController < ActionController::Base
  before_action :set_cache_buster

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    produtos_url
  end

  def set_cache_buster
   response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
   response.headers["Pragma"] = "no-cache"
   response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
end
end
