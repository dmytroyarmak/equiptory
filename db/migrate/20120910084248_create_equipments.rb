class CreateEquipments < ActiveRecord::Migration
  def change
    create_table :equipments do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.date :purchase_date
      t.date :placement_date
      t.date :warranty_end_date

      t.timestamps
    end
  end
end
