class Equipment < ActiveRecord::Base
  attr_accessible :name, :placement_date, :price, :purchase_date, :warranty_end_date
end
