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
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


#found here https://stackoverflow.com/questions/5267998/rails-3-field-with-errors-wrapper-changes-the-page-appearance-how-to-avoid-t
module PetFinderMockUp
  class Application < Rails::Application
    config.action_mailer.preview_path = "#{Rails.root}/test/mailers/previews"
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
      html_tag
    }
#    config.generators do |g|
#      g.fixture_replacement :factory_girl, :dir => "spec/factories"
#    end
# Settings in config/environments/* take precedence over those specified here.
# Application configuration should go into files in config/initializers
# -- all .rb files in that directory are automatically loaded.
  end
end
