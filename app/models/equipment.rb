#!/bin/env ruby
# encoding: utf-8
class Equipment < ActiveRecord::Base
  attr_accessible :name, :price, :location_id, :type_id, :state_id, :attribute_values_attributes, :purchase_date, :placement_date, :warranty_end_date
  has_many :attribute_values, :dependent => :destroy
  accepts_nested_attributes_for :attribute_values, allow_destroy: true
  belongs_to :location
  belongs_to :type
  belongs_to :state
  validates :name, :location_id, :type_id, :state_id, :presence => true
  validates :name, :uniqueness => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}, :allow_blank => true

  def self.search(search, type = nil, location = nil, state = nil)
    if search
      res = self.where('name LIKE ?', "%#{search}%")
      res = res.where('type_id = ?', type) unless type.blank?
      res = res.where('location_id = ?', location) unless location.blank?
      res = res.where('state_id = ?', state) unless state.blank?
      res
    else
      scoped
    end
  end
end