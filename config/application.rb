require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module AccessibilityRailsComponents
  class Application < Rails::Application
    config.load_defaults 7.1
    config.time_zone = "Auckland"
    config.view_component.generate.sidecar = true
    config.x.component_library_name = "Accessible Rails Components"
    config.x.component_library_version = "1.0.0"
  end
end
