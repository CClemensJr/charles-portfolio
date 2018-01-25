class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DeviseWhitelist

  # Create a session for users that come from an outside link
  before_action :set_source

  # Set the session and call it source and set it equal to params
  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
