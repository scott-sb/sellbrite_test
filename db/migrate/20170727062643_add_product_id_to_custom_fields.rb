class AddProductIdToCustomFields < ActiveRecord::Migration
  def up
    add_column :custom_fields, :product_id, :integer
    add_index :custom_fields, :product_id
    add_index :custom_fields, [:product_id, :key], unique: true
  end

  def down
    remove_index :custom_fields, [:product_id, :key]
    remove_index :custom_fields, :product_id
    remove_column :custom_fields, :product_id
  end
end
