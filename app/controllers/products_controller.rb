class ProductsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123456", only: [:destroy]
  
  # GET /departments/1/products
  def index
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = Department.all
    @department = @location.departments.find(params[:department_id])
    
    @products = @department.products
  end
  
  # GET /departments/1products/2
  def show
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = @location.departments.all
    
    @department = Department.find(params[:department_id])
    
    @product = @department.products.find(params[:id])
  end

  # GET /department/1products/new
  def new
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = @location.departments.all
    
    @department = Department.find(params[:department_id])
    
    @product = @department.products.build
  end
  
  # POST /department/1/products
  def create
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = @location.departments.all
    
    @department = Department.find(params[:department_id])
    
    @product = @department.products.build(params.require(:product).permit(:website_id, :barcode, :product_name, :product_desc, :size, :weight, :product_vendor, :quanity_in_stock, :buy_price_each, :sell_price_each))
    if @product.save
      redirect_to location_department_product_path(@location, @department, @product)
    else
      render :action => 'new'
    end
  end
  
  # GET /departments/1/products/2/edit
  def edit
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = @location.departments.all
    
    @department = Department.find(params[:department_id])
    
    @product = @department.products.find(params[:id])
  end
  
  # PUT /departments/1/products/2
  def update
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = @location.departments.all
    
    @department = Department.find(params[:department_id])
    @product = Product.find(params[:id])
    if @product.update_attributes(params.require(:product).permit(:website_id, :barcode, :product_name, :product_desc, :size, :weight, :product_vendor, :quanity_in_stock, :buy_price_each, :sell_price_each))
      redirect_to location_department_product_path(@location, @department, @product)
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /departments/1/products/2
  def destroy
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = @location.departments.all
    
    @department = Department.find(params[:department_id])
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to location_department_products_path(@location, @department) }
      format.xml { head :ok }
    end
  end

end
