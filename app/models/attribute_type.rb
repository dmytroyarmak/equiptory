class AttributeType < ActiveRecord::Base
  attr_accessible :name, :type_id
  belongs_to :type
end
