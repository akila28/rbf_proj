class SavingsdepositsController < ApplicationController

 autocomplete  :customer, :first_name, :display_value => :first_name, :full => true
 
  def index
      @savingsdeposits = Savingsdeposit.all
  end

  def pending
    @savingsdeposits = Savingsdeposit.all
  end

 def approve
      @savingsdeposits = Savingsdeposit.all
  end



  def new
      @savingsdeposit = Savingsdeposit.new
  end

  def create
    @savingsdeposit = Savingsdeposit.new(params[:savingsdeposit])
    if @savingsdeposit.save 
       flash[:success] = "Welcome!"
      redirect_to savingsdeposits_path          
     else
      flash[:alert] = "SD not added"
       render 'new'
     end    
  end

 def show
   @savingsdeposit = Savingsdeposit.find(params[:id])
   @customer = Customer.all
    #@savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
   @savingsdeposittransactions = Savingsdeposittransaction.all
 end

 def edit
   @savingsdeposit = Savingsdeposit.find(params[:id])
 end

   def update
      @savingsdeposit = Savingsdeposit.find(params[:id])
      #if @current_user.role == 'manager'
       #@savingsdeposit.update(params[:savingsdeposit].permit(:status => 'Approved'))
     #end

      if @savingsdeposit.update_attributes(params[:savingsdeposit])
        flash[:success] = "Profile updated successfully"
        redirect_to savingsdeposits_path(@savingsdeposit)
      else
         flash.now[:error] = "Cannot updating your profile"
         render 'edit'
      end
    end

  
end
