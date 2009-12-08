class Consumer < ActiveRecord::Base
  validates_uniqueness_of :url, :case_sensitive => false
end
