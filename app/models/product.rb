class Product < ActiveRecord::Base
  belongs_to :department
  belongs_to :order
  
  has_many :orders
end
