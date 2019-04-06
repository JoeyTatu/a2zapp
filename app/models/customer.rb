class Customer < ActiveRecord::Base
  belongs_to :employee
  
  has_many :payments
  has_many :orders

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
