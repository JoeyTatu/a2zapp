class CustNavController < ApplicationController
  def index
    @locations = Location.all
    @employees = Employee.all
    @customers = Customer.all
  end
  
end
