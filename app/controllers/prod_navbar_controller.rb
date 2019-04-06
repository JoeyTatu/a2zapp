class ProdNavbarController < ApplicationController
  def index
    @locations = Location.all
    @departments = Department.all
    @products = Product.all
  end
end
