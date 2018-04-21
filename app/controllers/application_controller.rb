class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :filter_routes
  include UsersHelper


  def build_url(link)
    url = []
    if session[:subregion]
      url << "/#{session[:subregion].shortname}"
    elsif session[:category]
      url << "/#{session[:category].titlize}"
    end
    url << "/#{link}"
    return url.join("")
  end
  helper_method :build_url
  private
    def filter_routes

      logger = Rails.logger
      logger.level = :debug

      scope = []
      # filter to region
      if !request.subdomains.any?
        session[:region] = Region.find_by_shortname("sfbay")
        scope << {:region => session[:region]}
        redirect_to "#{request.protocol}#{session[:region].name}.#{request.host}"
      else
        session[:region] = Region.find_by_shortname(request.subdomains.first)
        scope << {:region => session[:region]}
      end

      # if there is a subregion, let's use it to filter
      if params[:subregion]
        session[:subregion] = Subregion.find_by_shortname(params[:subregion])
        scope << session[:subregion]
      end

      logger.info "CAT #{params[:category]}"

      # if there is a category use it
      if params[:category]
        session[:category] = Category.find_by_shortname(params[:category])
        scope << session[:category]
      end

      logger.info scope
    end
end
