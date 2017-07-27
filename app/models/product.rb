class Product < ActiveRecord::Base
  has_many :product_custom_fields
  has_many :custom_fields, through: :product_custom_fields

  def create_custom_field(params)
    custom_fields.create!(key: params[:key], value: params[:value])
  end
end
