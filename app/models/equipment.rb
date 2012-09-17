class Equipment < ActiveRecord::Base
  attr_accessible :name, :placement_date, :price, :purchase_date, :warranty_end_date, :location_id
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}, allow_nil: true
end
