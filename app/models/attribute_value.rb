class AttributeValue < ActiveRecord::Base
  attr_accessible :attribute_type_id, :equipment_id, :value
  belongs_to :equipment
  belongs_to :attribute_type
end
