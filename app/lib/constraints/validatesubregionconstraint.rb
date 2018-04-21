module Constraints
  class ValidateSubRegionConstraint
    def matches?(request)
      logger = Rails.logger
      logger.level = :debug
      logger.info "Validate Sub Region Constraint"

      subregions = Region.find_by_shortname(request.subdomain).subregions

      if subregions.pluck(:shortname).include? request.query_parameters[:subregion]
        logger.info subregions.pluck(:shortname)
        logger.info "Was able to find subregion match? It's #{request.query_pareters[:subregion]}."
      else
        logger.info request.query_parameters
        logger.info subregions.pluck(:shortname)
        logger.info "No Match Found"
      end
      return true
    end
  end
end
