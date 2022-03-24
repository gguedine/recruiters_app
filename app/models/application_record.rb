class ApplicationRecord < ActiveRecord::Base
  extend ActiveRecordExtras
  self.abstract_class = true
end
