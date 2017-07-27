class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
