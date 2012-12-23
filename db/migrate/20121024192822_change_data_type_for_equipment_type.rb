class ChangeDataTypeForEquipmentType < ActiveRecord::Migration
  def up
    change_column :equipment, :price, :decimal, :precision => 8, :scale => 2
  end

  def down
    change_column :equipment, :price, :decimal
  end
end
