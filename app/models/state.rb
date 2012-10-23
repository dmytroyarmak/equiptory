class State < ActiveRecord::Base
  attr_accessible :name
  has_many :equipment, :dependent => :restrict
  validates :name, :presence => true
end
