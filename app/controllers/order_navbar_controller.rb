class OrderNavbarController < ApplicationController
  def index
    @locations = Location.all
    @employees = Employee.all
    @customers = Customer.all
    @orders = Order.all
  end
end
