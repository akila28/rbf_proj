class RegistrationController < Devise::RegistrationsController

def new

@user= User.new
@customer = Customer.new
end

def create

@user = User.new
@user.username = params[:user][:username]
@user.email = params[:user][:email]
@user.password = params[:user][:password]
@user.password_confirmation =params[:user][:password_confirmation]

@customer = Customer.new
@customer.first_name = params[:customer][:first_name]
@customer.last_name = params[:customer][:last_name]
@customer.date_of_birth = params[:customer][:date_of_birth]
@customer.sex = params[:customer][:sex]
@customer.address = params[:customer][:address]
@customer.city = params[:customer][:city]
@customer.state = params[:customer][:state]
@customer.pincode = params[:customer][:pincode]
@customer.PAN = params[:customer][:PAN]
@user.valid?
if @user.errors.blank?

@user.save
@customer.user = @user
@customer.save
redirect_to dashboard_path
else
render :action => "new"
end
end


end
