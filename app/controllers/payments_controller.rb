class PaymentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123456", only: [:destroy]
  
  # GET /customers/1/payments
  def index
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = Customer.all
    @customer = Customer.find(params[:customer_id])
    
    @payments = @customer.payments
  end
  
  # GET /customers/payments/2
  def show
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @payment = @customer.payments.find(params[:id]) 
  end

  #GET /customers/1/payments/new
  def new
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @payment = @customer.payments.build
  end
  
  # POST /customers/1/payments
  def create
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @payment = @customer.payments.build(params.require(:payment).permit(:card_type, :card_num, :transaction_ref, :payment_date, :amount))
    if @payment.save
      redirect_to location_employee_customer_payment_path(@location, @employee, @customer, @payment)
    else
      render :action => 'new'
    end
  end
  
  # GET customers/1/payments/2/efit
  def edit
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    
    @payment = @customer.payments.find(params[:id])
  end
  
  # PUT /customers/1/payments/2
  def update
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(params.require(:payment).permit(:card_type, :card_num, :transaction_ref, :payment_date, :amount))
      redirect_to location_employee_customer_payment_path(@location, @employee, @customer, @payment)
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /custoemrs/1/payments/1
  def destroy
    @locations = Location.all
    @location = Location.find(params[:location_id])
    @employees = Employee.all
    @employee = Employee.find(params[:employee_id])
    @customers = @employee.customers.all
    
    @customer = Customer.find(params[:customer_id])
    @payment = Payment.find(params[:id])   
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to  location_employee_customer_payments_path(@location, @employee, @customer) }
      format.xml { head :ok }
    end
  end
  
end
