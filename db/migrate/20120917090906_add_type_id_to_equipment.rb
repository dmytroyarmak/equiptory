class AddTypeIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :type_id, :integer
  end
end
