class AddLocationToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :location_id, :integer
  end
end
