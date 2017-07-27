class CustomFieldsController < ApplicationController
  before_action :set_product
  before_action :set_custom_field, only: [:update, :destroy]

  def create
    @product.create_custom_field(custom_field_params)
    redirect_to @product, notice: 'Custom field successfully created!'
  rescue ActiveRecord::RecordInvalid
    redirect_to edit_product_path(@product), flash: { error: 'Could not create custom field' }
  end

  def update
    respond_to do |format|
      if @custom_field.update(custom_field_params)
        format.html { redirect_to @product, notice: 'Custom field was successfully updated.' }
      else
        format.html { redirect_to edit_product_path(@product), error: 'Could not update custom field' }
      end
    end
  end

  def destroy
    @custom_field.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Custom field was successfully destroyed.' }
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_custom_field
    @custom_field = CustomField.find(params[:id])
  end

  def custom_field_params
    params.require(:custom_field).permit(:key, :value)
  end
end
