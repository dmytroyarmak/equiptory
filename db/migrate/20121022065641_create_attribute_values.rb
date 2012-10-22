class CreateAttributeValues < ActiveRecord::Migration
  def change
    create_table :attribute_values do |t|
      t.integer :equipment_id
      t.string :value
      t.integer :attribute_type_id

      t.timestamps
    end
  end
end
