module Constraints
  class ValidateCategoryConstraint
    def matches?(request)
      logger = Rails.logger
      logger.level = :debug
      logger.info "Validate Category Constraint"
      return true
    end
  end
end
