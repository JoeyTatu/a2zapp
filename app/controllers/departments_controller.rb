class DepartmentsController < ApplicationController
  
  http_basic_authenticate_with name: "admin", password: "123456", only: [:destroy]
  
  # Get /locations/1/departments
  def index
    # For URL like /locations/1/departments
    # Get department with id=1
    @locations = Location.all
    
    @location = Location.find(params[:location_id])
    
    #Access all departments for that location
    @departments = @location.departments
    @address = @location.address
  
  end

  # GET locations/1/departments/2
  def show
    @locations = Location.all
    @location = Location.find(params[:location_id])
    
    # For URL like /locations/1/departments/2
    # Find a department in location 1 that has id=2
    @department = @location.departments.find(params[:id])
  end

  # Get /locations/1/departments/new
  def new
    @locations = Location.all
    @location = Location.find(params[:location_id])
    
    # Associate a department object with location 1
    @department = @location.departments.build
  end
  
  # POST /locations/1/departments
  def create
    @locations = Location.all
    @location = Location.find(params[:location_id])
    
    # For URL likr /locations/1/departments
    # Populate a department associate with location 1 with form data
    # Location will be associated with the department
    # @department = @location.departments.build(params.require(:department).permit
    @department = @location.departments.build(params.require(:department).permit(:department_name, :description, :department_phone))
    if @department.save
      #Save the department successfully
      redirect_to location_department_url(@location, @department)
    else
      render :action => 'new'
    end
  end

  # GET /locations/1/departments/2/edit
  def edit
    @locations = Location.all
    @location = Location.find(params[:location_id])
    
    # For URL like /locations/1/departments/2/edit
    # Get department id=2 for location 1
    @department = @location.departments.find(params[:id])
  end
  
  # PUT /locations/1/departments/2
  def update
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @department = Department.find(params[:id])
    if @department.update_attributes(params.require(:department).permit(:department_name, :description, :department_phone))
      
      # Save the department successfully
      redirect_to location_department_url(@location, @department)
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /locations/1/departments/2
  def destroy
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @department = Department.find(params[:id])
    @department.destroy
    respond_to do |format|
    format.html { redirect_to location_departments_path(@location) }
    format.xml { head :ok }
    end
  end
  
end