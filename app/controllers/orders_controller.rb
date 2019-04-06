class OrdersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123456", only: [:destroy]
  
  # GET /customers/1/orders
  def index
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = Department.all
    @products = Product.all
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @orders = @customer.orders
  end
  
  # GET /customers/1/orders/2
  def show
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = Department.all
    @products = Product.all
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @order = @customer.orders.find(params[:id])
    #@product = @order.products.find(params{:product_id})
  end
  
  # GET /customers/1/orders/new
  def new
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = Department.all
    @products = Product.all
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @order = @customer.orders.build
  end
  
  # POST /customers/1/orders
  def create
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = Department.all
    @products = Product.all
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @order = @customer.orders.build(params.require(:order).permit(:order_date, :due_on, :shipped_on, :status, :comments, :product_id) )
    if @order.save
      redirect_to location_employee_customer_order_path(@location, @employee, @customer, @order)
    else
      render :action => 'new'
    end
  end
  
  # GET /customers/1/payments/2/edit
  def edit
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = Department.all
    @products = Product.all
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @order = @customer.orders.find(params[:id])
  end
  
  # PUT /customers/1/orders/2
  def update
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = Department.all
    @products = Product.all
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    @order = Order.find(params[:id])
    if @order.update_attributes(params.require(:order).permit(:order_date, :due_on, :shipped_on, :status, :comments, :product_id) )
      redirect_to location_employee_customer_order_path(@location, @employee, @customer, @order)
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /customer/1/orders/2
  def destroy
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @departments = Department.all
    @products = Product.all
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id]) 
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to  location_employee_customer_orders_path(@location, @employee, @customer) }
      format.xml { head :ok }
    end
  end
  
end