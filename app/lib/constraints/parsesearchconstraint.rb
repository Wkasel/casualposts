module Constraints
  class ParseSearchConstraint
    def matches?(request)
      logger = Rails.logger
      logger.level = :debug
      logger.info "Parse Search Constraint"
      return true
    end
  end
end
