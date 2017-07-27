class Product < ActiveRecord::Base
  has_many :custom_fields, dependent: :destroy

  def create_custom_field(params)
    custom_fields.create!(key: params[:key], value: params[:value])
  end
end
