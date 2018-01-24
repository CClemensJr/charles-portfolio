module DeviseWhitelist
  extend ActiveSupport::Concern
  included do
    # Before ant controllers are ran, run this method if there is a devise_controller
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  # This is the method that allows a name attribute to be added.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
