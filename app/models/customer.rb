# == Schema Information
#
# Table name: customers
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  date_of_birth :date
#  sex           :string(255)
#  address       :text
#  city          :string(255)
#  state         :string(255)
#  pincode       :integer
#  PAN           :text
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Customer < ActiveRecord::Base
  attr_accessible :PAN, :address, :city, :date_of_birth, :first_name, :last_name, :pincode, :sex, :state, :status

before_save :set_default_val
 def set_default_val
    self.status = 'Pending' unless self.status
 end

validates :first_name, presence: true,
		       format: { with: %r{^[A-Z][a-zA-Z\s]*} }
validates :last_name, presence: true,
		      format: { with: %r{^[A-Z][a-zA-Z\s]*} }

validates_numericality_of :pincode, presence: true
validates_length_of :pincode, :is => 6, :wrong_length => "should have 6digits"

validates :PAN, presence: true, format: { with: %r{^[A-Z]{5}\d{4}[A-Z]{1}} }
validates_length_of :PAN, :is => 10, :wrong_length => "should have 10digits"

validates_inclusion_of :date_of_birth,
                :in => Date.civil(1900,1,1)..Date.today,
                 :message => "is invalid"

validates :address, presence: true
validates :sex, presence: true
validates :state, presence: true
validates :city, presence: true
end
