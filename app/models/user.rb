class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable (confirmation email), :lockable (Allows user to be locked out with failed login attempts),
  # :timeoutable (Allows user to be logged out after a certain time) and :omniauthable (Allows third party logins like facebook or google)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Make sure the user enters a name
  validates_presence_of :name
  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
