class PayNavController < ApplicationController
  def index
    @locations = Location.all
    @employees = Employee.all
    @customers = Customer.all
    @payments = Payment.all
  end
  
end
