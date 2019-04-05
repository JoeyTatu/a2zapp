class DeptNavbarController < ApplicationController
  def index
    @departments = Department.all
    @locations = Location.all
  end
  
end