class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_region
  include UsersHelper
  private
    def set_current_region
      if !request.subdomains.any?
        @current_region = Region.find_by_shortname("sfbay")
        redirect_to "#{request.protocol}sfbay.#{request.host}"
      else
        @current_region = Region.find_by_shortname(request.subdomains.first)
      end
    end
end
