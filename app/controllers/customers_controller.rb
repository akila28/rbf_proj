class CustomersController < ApplicationController
 
 def index
  @customers = Customer.all
  @customers = Customer.where("first_name LIKE ? OR code LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").paginate(page: params[:page], per_page: 5)
 end 

 def new
  @customer = Customer.new
 end

 def create
  @customer = Customer.new(params[:customer])
   if @customer.save
      flash[:success] = "Welcome to RBF!"
      redirect_to customer_path(@customer)
    else
      flash[:alert] = "Customer not added"  
      render 'new'
    end
 end

 def edit
  @customer = Customer.find(params[:id])
 end

 def update
  @customer = Customer.find(params[:id])
  if @customer.update_attributes(params[:customer])
    flash[:success] = "updated successfully"
    redirect_to customers_path(@customer)
    else
    flash[:alert] = "failed"
    render 'edit'
  end
 end

 def show
    @customer = Customer.find(params[:id])
 end
 
 def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
  flash[:notice] = "customer has been deleted"
  redirect_to customers_path
  end
end
