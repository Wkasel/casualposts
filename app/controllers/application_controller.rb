class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_current_region
  include UsersHelper

  private
    def set_current_region
      # @current_region = Region.find_by_shortname!(request.subdomains.first)
    end
end
