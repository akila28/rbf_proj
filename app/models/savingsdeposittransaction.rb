class Savingsdeposittransaction < ActiveRecord::Base
belongs_to :savingsdeposit
attr_accessor :current_balance
attr_accessible :current_balance 

attr_accessible :comments, :particulars, :status, :transaction_amount, :transaction_date, :transaction_mode, :transaction_type, :savingsdeposit_id

   before_save :set_default_val
     def set_default_val
      self.status = 'Pending' unless self.status
     end

   before_save :transaction_date
     def set_transaction_date
      self.transaction_date = Date.today
     end


 before_save :transaction_date
     def set_transaction_date
      self.transaction_date = Date.today
     end

before_save :bal 
def bal
 # savingsdeposit.current_balance=savingsdeposit.current_balance + transaction_amount
Savingsdeposittransaction.sum(:transaction_amount)
  end


  validates :transaction_mode, presence: true

  validates :transaction_type, presence: true

  validates :transaction_amount, presence: true



end
