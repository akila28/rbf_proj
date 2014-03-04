class SavingsdepositsController < ApplicationController

autocomplete  :customer, :first_name, :display_value => :first_name, :full => true

 def new
  @savingsdeposit = Savingsdeposit.new
 end

 def create
  @savingsdeposit = Savingsdeposit.new(params[:savingsdeposit])
  if @savingsdeposit.save
   flash[:success] = "savingsdeposit details!"
   redirect_to savingsdeposits_path          
    else
   flash[:alert] = "savingsdeposit not added"
   render 'new'
  end    
 end


 def index
  @savingsdeposits = Savingsdeposit.all
  @savingsdeposits = Savingsdeposit.where("customer_id LIKE ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 5)
  @customers = Customer.all
 end 

 def edit
  @savingsdeposit = Savingsdeposit.find(params[:id])
 end

 def show
  @savingsdeposit = Savingsdeposit.find(params[:id])
  @customer = Customer.all
  @savingsdeposittransactions = Savingsdeposittransaction.all
 end

def update
  @savingsdeposit = Savingsdeposit.find(params[:id])
   if @savingsdeposit.update_attributes(params[:savingsdeposit])
    flash[:success] = "updated successfully"
    redirect_to savingsdeposits_path(@savingsdeposit)
    else
    flash[:alert] = "failed"
    render 'edit'
   end
 end

end
