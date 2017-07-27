class CustomField < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :key, :value, :product
  validates :product, uniqueness: { scope: :key,
      message: 'Cannot have 2 of the same named custom fields for a product' }
end
