class CreateProductCustomFields < ActiveRecord::Migration
  def change
    create_table :product_custom_fields do |t|
      t.references :product, index: true
      t.references :custom_field, index: true

      t.timestamps
    end
  end
end
