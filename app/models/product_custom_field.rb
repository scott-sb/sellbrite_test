class ProductCustomField < ActiveRecord::Base
  belongs_to :product
  belongs_to :custom_field

  validates_presence_of :product, :custom_field
  validates :product, uniqueness: { scope: :custom_field,
      message: "Cannot have 2 of the same named custom fields for a product" }  
end
