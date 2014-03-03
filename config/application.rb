require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Boozebox
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local

    # asset precompile setting for Heroku
    config.assets.initialize_on_precompile = false

    # get sass to compile my files in vendor
    config.sass.load_paths << File.expand_path('../../vendor/assets/stylesheets/')
    
    # fonts
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile += %w(*.svg *.eot *.ttf *.woff)

    # rspec generators
    config.generators do |g|
        g.test_framework :rspec,
            fixtures: true,
            view_specs: false,
            helper_specs: false,
            controller_specs: false,
            request_specs: true
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
