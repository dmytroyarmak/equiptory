class Equipment < ActiveRecord::Base
  attr_accessible :name, :price, :location_id, :type_id, :state_id
  has_many :attribute_values
  belongs_to :location
  belongs_to :type
  belongs_to :state
end
