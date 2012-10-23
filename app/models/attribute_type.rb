class AttributeType < ActiveRecord::Base
  attr_accessible :name, :type_id
  has_many :attribute_values, :dependent => :destroy
  belongs_to :type
  after_save { |attr_type| attr_type.destroy if attr_type.name.blank? }
end
