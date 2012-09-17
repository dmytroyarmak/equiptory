class Equipment < ActiveRecord::Base
  attr_accessible :name, :price, :location_id
  belongs_to :location
end
