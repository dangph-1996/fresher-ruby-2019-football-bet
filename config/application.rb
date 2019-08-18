require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module FresherRuby2019FootballBet
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
  end
end
