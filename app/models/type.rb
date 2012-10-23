class Type < ActiveRecord::Base
  attr_accessible :name, :attribute_types_attributes
  has_many :equipment
  has_many :attribute_types, :dependent => :destroy
  accepts_nested_attributes_for :attribute_types, allow_destroy: true
  validates :name, :presence => true
end
