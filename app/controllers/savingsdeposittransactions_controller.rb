class SavingsdeposittransactionsController < ApplicationController

 def new
      @savingsdeposittransaction = Savingsdeposittransaction.new
      @savingsdeposittransaction.savingsdeposit_id = params[:id]
 end

  def create
     @savingsdeposittransaction = Savingsdeposittransaction.new(params[:savingsdeposittransaction])
      if @savingsdeposittransaction.save
        flash[:success] = "Welcome!"
       redirect_to savingsdeposittransaction_path
         #render 'savingsdeposits/show'
         #redirect_to :action => :show, :id => @savingsdeposittransaction.id
      # redirect_to savingsdeposittransaction_path(@savingsdeposittransaction) 
       else
        flash[:alert] = "savingsdeposittransaction not added"
        render 'new'
      end    
    end

  def edit
      @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
  end

  def update
     @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
       if @savingsdeposittransaction.update_attributes(params[:savingsdeposittransaction])
          flash[:success] = "updated successfully"
          redirect_to savingsdeposittransaction_path(@savingsdeposittransaction)
         else
          flash[:alert] = "failed"
          render 'edit'
        end
      end

  def show
       @savingsdeposittransaction = current.savingsdeposittransaction
     @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
      @customer = Customer.all

  end
 
  def destroy
    @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
    @savingsdeposittransaction.destroy
     flash[:notice] = "savingsdeposittransaction has been deleted"
     redirect_to savingsdeposittransaction_path
  end
end
