class Equipment < ActiveRecord::Base
  attr_accessible :name, :price, :location_id, :type_id, :state_id, :attribute_values_attributes
  has_many :attribute_values, :dependent => :destroy
  accepts_nested_attributes_for :attribute_values, allow_destroy: true
  belongs_to :location
  belongs_to :type
  belongs_to :state
  validates :name, :location_id, :type_id, :state_id, :presence => true
end
