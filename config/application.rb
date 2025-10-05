require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie" if defined?(Sprockets)
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile
Bundler.require(*Rails.groups)

module AccessibilityRailsComponents
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #

    # Set New Zealand as default timezone
    config.time_zone = 'Auckland'

    # ViewComponent configuration
    config.view_component.generate.sidecar = true
    config.view_component.generate.stimulus_controller = true
    config.view_component.generate.helper = false
    config.view_component.generate.preview = true
    config.view_component.show_previews = true
    config.view_component.preview_paths << Rails.root.join("test/components/previews")
    
    # Preview controller for component development
    config.view_component.default_preview_layout = "component_preview"
    
    # Accessibility-specific configuration
    config.x.accessibility_testing = true
    config.x.wcag_level = 'AA'
    config.x.supported_languages = %w[en mi] # English and Te Reo Māori
    
    # Component library configuration
    config.x.component_library_name = 'Accessible Rails Components'
    config.x.component_library_version = '1.0.0'
  end
end