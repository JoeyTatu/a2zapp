class EmployeesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123456", only: [:destroy]
  
  # GET /locations/1/employees
  def index
    @locations = Location.all
    # For URL like /locations/1/employees
    # Get the location with id=1
    @location = Location.find(params[:location_id])
    
    # Access all employees for that location
    @employees = @location.employees
  end

  # GET /locations/1/employees/2
  def show
    @locations = Location.all
    @location = Location.find(params[:location_id])
    
    # For URL like /locations/1/employees/2
    # Find an employee in locations 1 that has id=2
    @employee = @location.employees.find(params[:id])
  end

  # GET /locations/1/employees/new
  def new
    @locations = Location.all
    @location = Location.find(params[:location_id])
    
    # Associate an employee object with location 1
    @employee = @location.employees.build
  end
  
  # POST /locations/1/employees
  def create
  @locations = Location.all
  @location = Location.find(params[:location_id])
  
  # For URL like /locations/1/employees
  # Populate an employee associate with location 1 with form data
  # Location will be associated with the employee
  # @employee = @location.employees.build(params.require(:employee).permit!)
  @employee = @location.employees.build(params.require(:employee).permit(:type, :first_name, :last_name, :started_on, :left_on, :address, :address2, :city, :postal_code, :country, :personal_phone, :office_phone))
    if @employee.save
      # Save the employee successfully
      redirect_to location_employee_url(@location, @employee)
    else
      render :action => "new"
    end
  end
  
  # GET /locations/1/employees/2/edit
  def edit
    @locations = Location.all
    @location = Location.find(params[:location_id])
    
    # For URL like /locations/1/employees/2/edit
    # Get employee id=2 for location 1
    @employee = @location.employees.find(params[:id])
  end
  
  # PUT /locations/1/employees/2
  def update
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employee = Employee.find(params[:id])
    if @remployee.update_attributes(params.require(:employee).permit(:type, :first_name, :last_name, :started_on, :left_on, :address, :address2, :city, :postal_code, :country, :personal_phone, :office_phone))
      # Save the employee successfully
      redirect_to location_employee_url(@locaiton, @employee)
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /locations/1/employees/2
  def destroy
    @locations = Location.all
    @locaiton = Location.find(params[:location_id])
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to location_employees_path(@location) }
      format.xml { head :ok }
    end
  end
  
end
