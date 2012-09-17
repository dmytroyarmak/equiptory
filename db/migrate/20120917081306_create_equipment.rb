class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
