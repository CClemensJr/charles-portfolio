module ApplicationHelper
  def login_helper
    # If an user is logged in that inherits from the User class (not an OpenStruct
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, method: :delete
    # Otherwise show register/login links
    else
      (link_to "Sign Up", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path)
    end
  end
end
