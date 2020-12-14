# Our application record base abstract class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
