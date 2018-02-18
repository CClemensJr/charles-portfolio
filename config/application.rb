require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module CharleClemPortfolio
  class Application < Rails::Application
    # Makes lib directory available to rest of Application
    # config.eager_load_paths << "#{Rails.root}/lib"
    config.eager_load_paths << Rails.root.join('lib')
  end
end
