class Equipment < ActiveRecord::Base
  attr_accessible :name, :price, :location_id, :type_id
  belongs_to :location
  belongs_to :type
end
