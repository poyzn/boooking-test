require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Boooking
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.angular_templates.ignore_prefix  = %w(angular/templates/)
    config.angular_templates.inside_paths   = ['app/assets/javascripts/angular']

    config.to_prepare do
      DeviseController.respond_to :html, :json
    end

  end
end
