class AttributeType < ActiveRecord::Base
  attr_accessible :name, :type_id
  has_many :attribute_values
  belongs_to :type
end
