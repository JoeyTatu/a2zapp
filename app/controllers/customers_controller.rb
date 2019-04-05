class CustomersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123456", only: [:destroy]
  
  # GET /employees/1/customers
  def index
    # For URL like /employees/1/customers
    # Get the customer with id=1
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    
    # Access all customers for that employee (sales rep)
    @customers = @employee.customers
  end

  # GET /employees/1/customers/2
  def show
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = @location.employees.all
    

    @employee = Employee.find(params[:employee_id])
    
    # For URL like /emlpoyees/1/customers/2
    # Find a customer in employee 1 that has id=2
    @customer = @employee.customers.find(params[:id])
  end

  # GET /employees/1/customers/new
  def new
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = @location.employees.all
    
    @employee = Employee.find(params[:employee_id])
    
    
    # Associate a customer object with employee 1
    @customer = @employee.customers.build
  end
  
  # POST /employees/1/employees
  def create
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = @location.employees.all
    
    @employee = Employee.find(params[:employee_id])
    
    # For URL like /employees/1/customers
    # Populate a customer associate with employee 1 with form data
    # Employee will be associated with the customer
    # @customer = @employee.customers.build(params.require(:customer).permit!)
    @customer = @employee.customers.build(params.require(:customer).permit(:first_name, :last_name, :last_active, :address, :address2, :city, :postal_code, :country, :phone ))
    if @customer.save
      # Save the customer successfully
      redirect_to location_employee_customer_path(@location, @employee, @customer)
    else
      render :action => 'new'
    end
  end

  # GET employees/1/customers/2/edit
  def edit
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = @location.employees.all
    
    @employee = Employee.find(params[:employee_id])
    
    # For URL like /employees/1/customers/2/edit
    # Get customer id=2 for employee 1
    @customer = @employee.customers.find(params[:id])
  end
  
  # PUT /employees/1/customers/2
  def update
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = @location.employees.all
    
    @employee = Employee.find(params[:employee_id])
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params.require(:customer).permit(:first_name, :last_name, :last_active, :address, :address2, :city, :postal_code, :country, :phone ))
      # Save the customer sucessfully
      redirect_to location_employee_customer_url(@location, @employee, @customer)
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /employees/1/customers/2
  def destroy
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = @location.employees.all
    
    @employee = Employee.find(params[:employee_id])
    @customer = Customer.find(params[:id])   
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to location_employee_customers_path(@location, @employee) }
      format.xml { head :ok }
    end
  end

end
