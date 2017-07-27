class CustomField < ActiveRecord::Base
  validates_presence_of :key, :value
  validates_uniqueness_of :key
end
