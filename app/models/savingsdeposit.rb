class Savingsdeposit < ActiveRecord::Base
  belongs_to :customer
  has_many :savingsdeposittransactions
  accepts_nested_attributes_for :savingsdeposittransactions
  attr_accessible :account_type, :opened_on, :status, :customer_id, :current_balance

   attr_accessible :savingsdeposittransactions_attributes
   attr_accessor :transaction_amount

  before_save :set_opened_on
     def set_opened_on
      self.opened_on = Date.today
     end


  before_save :set_default_val
     def set_default_val
      self.status = 'Pending' unless self.status
     end


  validates :customer_id, presence: true

  validates :account_type, presence: true

  validates_numericality_of :current_balance, presence: true

end
