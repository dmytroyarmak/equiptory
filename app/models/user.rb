#!/bin/env ruby
# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :rememberable, :trackable, :validatable 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role_id
  # attr_accessible :title, :body
  validates :first_name, :last_name, :role_id, :presence => true
  validates :role_id, :inclusion => {:in => [1, 2, 3]}

  def role
    case role_id
    when 1
      "Супер адміністратор"
    when 2
      "Адміністратор"
    when 3
      "Користувач"
    else
      "Неіснуюча роль"      
    end
  end
end
