class AddDateFieldsToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :purchase_date, :date
    add_column :equipment, :placement_date, :date
    add_column :equipment, :warranty_end_date, :date
  end
end
