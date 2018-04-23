module Constraints
  class ParseFilterURLConstraint
    def matches?(request)

      # session[:region] = 'SANNNN FRANNNN'
      # => This is all going to be deleted - was scratch work >>

      # redirect("/s/123123")

      # @region = request.subdomain
      # @subregion = request['filter']
      # [http|https]://[Region].casualposts.[com|test|dev]/s/[Subregion]/[Category]/search/[search-term-hyphenated]/posts/[post-slug-hyphinated](/{id}.html)
      #                        (filter)              [search][term]
      # sfbay.casualposts.com/s/sfc/casual-encounters/search/w4m/posts
      # sfbay.casualposts.com/s/casual-encounters/posts/looking-for-love/00231.html
      # logger = Rails.logger
      # logger.level = :debug
      # logger.debug request.path.inspect
      # logger.info request.subdomain
      # logger.info "Parse Filter URL Constraint"
      # logger.info "REGION ---> #{session[:region]}"
      #
      #
      #
      # logger.info request.path_parameters[:filters].split('/')
      # filter = request.path_parameters[:filters].split('/')
      # ['wst', 'casual-encounters', 'w4m']
      # ["w4w", "w4ww", "w4mw", "w4t", "w4m",
      # "w4mm", "w4tt", "ww4w", "ww4ww", "ww4mw",
      # "ww4t", "ww4m", "ww4mm", "ww4tt", "mw4m",
      # "mw4ww", "mw4mw", "mwt", "mw4m", "mw4mm",
      # "mw4tt", "t4w", "t4ww", "t4mw", "t4t", "t4m",
      # "t4mm", "t4tt", "m4w", "m4ww", "m4mw", "m4t",
      # "m4m", "m4mm", "m4tt"]
      #
      # # setup our vars
      # subregions = []
      # cats = ['casual-encounters','missed-connections','strictly-platonic']
      # region = Region.find_by_shortname(request.subdomain)
      # region.subregions.collect{|x| subregions << x.shortname}
      #
      # # check region subdomain
      #
      #
      # # set scope to subregion if exists
      #
      # logger.info "CURRENT REGION #{@current_region}"
      #
      #
      # if cats.include? filter[0]
      #   # no city filter
      #   logger.info "No City Filter"
      # elsif subregions.include? filter[0]
      #   #subregion filter in url
      #
      #   logger.info "Using Subregion in filter"
      # else
      #   #cannot recognized
      #   logger.info filter[0]
      #   logger.info "404 NOT FOUNDDDDDD"
      #   # raise ActionController::RoutingError.new('Not Found')
      # end


      return true
    end
  end
end
