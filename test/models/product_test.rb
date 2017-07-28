require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "create a valid custom field" do
    product = Product.create
    product.create_custom_field({key: 'foo', value: 'bar'})
    assert_equal(product.custom_fields.count, 1)
  end

  test "cannot have 2 custom fields with same name" do
    product = Product.create
    product.create_custom_field({key: 'foo', value: 'bar'})
    assert_raises(ActiveRecord::RecordInvalid) {
      product.create_custom_field({key: 'foo', value: 'bazzz'})
    }
  end
end
