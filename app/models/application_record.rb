class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # include search filter in app record for global access
  include SearchFilter
end
