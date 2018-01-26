module CurrentUserConcern
  extend ActiveSupport::Concern

  # Override the current_user method to make current user available even when not logged in
  def current_user
    # if user login perform  same behavior as original method, else return the OpenStruct
    # the OpenStruct allows for mimicry of the user.
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User",
                            first_name: "Guest",
                            last_name: "User",
                            email: "guest_user@example.com")
  end
end
