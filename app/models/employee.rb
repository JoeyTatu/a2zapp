class Employee < ActiveRecord::Base
  belongs_to :location
  
  has_many :customers
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
