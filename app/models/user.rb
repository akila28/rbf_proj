class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
   has_many :customers
<<<<<<< HEAD

=======
   #has_one :customer
>>>>>>> 61023aa5d3e1024519592224d159dd5e4481dc9f
  # attr_accessible :title, :body

end
