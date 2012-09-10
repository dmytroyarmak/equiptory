require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  fixtures :equipment

  test "equipment name must not be empty" do
    equipment = Equipment.new
    assert equipment.invalid?
    assert equipment.errors[:name].any?
  end

  test "equipment price must be positive" do
    equipment = Equipment.new(  name: "12345678" )
    equipment.price = -1
    assert equipment.invalid?
    assert_equal "must be greater than or equal to 0.01",
    equipment.errors[:price].join('; ')
    equipment.price = 0
    assert equipment.invalid?
    assert_equal "must be greater than or equal to 0.01",
    equipment.errors[:price].join('; ')
    equipment.price = 1
    assert equipment.valid?
  end

  test "equipment is not valid without a unique name" do
    equipment = Equipment.new( name: equipment(:pc).name )
    assert !equipment.save
    assert_equal "has already been taken", equipment.errors[:name].join('; ')
  end

end
