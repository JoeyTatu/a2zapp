class Customer < ActiveRecord::Base
  belongs_to :employee
  
  has_many :payments
end
