module ApplicationHelper
  def login_helper style = ''
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

  # Copyright for footer
  def copyright_generator
    KaimuraiCopyrightTool::Renderer.copyright 'Charles Clemens', 'All rights reserved'
  end

  # Create an array of hashes that detail the separate nav items
  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      }
    ]
  end
  
  # Returns a set of links based on style and content tag
  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
