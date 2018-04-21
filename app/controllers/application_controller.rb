class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :filter_routes
  include UsersHelper


  def build_url(link)
    url = []
    # http://sfbay.casualposts.test/s/sfc/casual-encounters/w4m/posts
    if session[:subregion]
      url << "/s/#{session[:subregion].shortname}"
    elsif session[:category]
      url << "/c/#{session[:category].titleize}"
    else
      url << 'a'
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
        redirect_to "#{request.protocol}#{session[:region].shortname}.#{request.host}"
      else
        session[:region] = Region.find_by_shortname(request.subdomains.first)
        scope << {:region => session[:region]}
      end

      # if there is a subregion, let's use it to filter
      if params[:subregion]
        session[:subregion] = Subregion.find_by_shortname(params[:subregion])
        scope << session[:subregion]
      else
        session.delete(:subregion)
      end

      logger.info "CAT #{params[:category]}"

      # if there is a category use it
      if params[:category]
        session[:category] = Category.find_by_shortname(params[:category])
        scope << session[:category]
      else
        session.delete(:category)
      end

      logger.info scope
    end
end
