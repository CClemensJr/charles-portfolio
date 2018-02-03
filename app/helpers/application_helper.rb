module ApplicationHelper
  def login_helper style
    # If an user is logged in that inherits from the User class (not an OpenStruct
    if current_user.is_a?(GuestUser)
      (link_to "Sign Up", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    # Otherwise show register/login links
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  # Source is an external website
  def source_helper(layout_name)
    # So if the session was initiated from an external source
    if session[:source]
      # Create a greeting that will thank the visitor from visiting from the source site
      greeting = "Welcome to the #{layout_name}. Thanks for visiting me from #{session[:source]}"
      # Then use a content tag to dynamically create html that dynamically displays a string between p tags that have a css class of source-greeting
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    KaimuraiCopyrightTool::Renderer.copyright 'Charles Clemens', 'All rights reserved'
  end
end
