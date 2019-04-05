class Customer < ActiveRecord::Base
  belongs_to :employee
  
  has_many :payments

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
