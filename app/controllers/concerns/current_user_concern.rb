module CurrentUserConcern
  extend ActiveSupport::Concern

  # Override the current_user method to make current user available even when not logged in
  def current_user
    # if user login perform  same behavior as original method, else return the OpenStruct
    # the OpenStruct allows for mimicry of the user.
    super || guest_user
  end

  def guest_user
    # Refactor guest_user to take advantage of class methods instead of the OpenStruct which
    # conflicted with the petergate gem
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest

    #OpenStruct.new(name: "Guest User",
    #                        first_name: "Guest",
    #                        last_name: "User",
    #                        email: "guest_user@example.com")
  end
end
