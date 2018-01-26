module SetSource
  extend ActiveSupport::Concern

  included do
  # Create a session for users that come from an outside link
    before_action :set_source
  end

  # Set the session and call it source and set it equal to params
  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
