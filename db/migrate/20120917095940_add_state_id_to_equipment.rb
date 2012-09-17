class AddStateIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :state_id, :integer
  end
end
