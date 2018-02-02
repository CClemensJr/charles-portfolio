#This will allow the app to fill in guest user data that does not conflict with petergate gem
class GuestUser < User
  #provides getters and setters
  attr_accessor :name, :first_name, :last_name, :email
end
