class FilterController < ApplicationController
  def filter
    logger.info params
    logger.info "Filter Controller"
  end
end
