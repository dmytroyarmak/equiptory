class Type < ActiveRecord::Base
  attr_accessible :name, :attribute_types_attributes
  has_many :equipment
  has_many :attribute_types
  accepts_nested_attributes_for :attribute_types, allow_destroy: true
end
