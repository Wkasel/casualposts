module RouteFilter
  extend ActiveSupport::Concern

  included do
      before_action :filter_route
  end

  def filter_route
    logger = Rails.logger
    logger.level = :debug
    logger.info "Filter Route Concern"
  end
end
