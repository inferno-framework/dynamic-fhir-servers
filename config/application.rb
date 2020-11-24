# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'
require 'json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FhirApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.api_only = true
    config.active_record.schema_format = :sql

    configFile = File.read("config/config.json")
    configFileData = JSON.parse(configFile)

    config.capabilityStatementName = configFileData["capabilityStatementName"]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # puts("parsing and storing data")
    # file = ""
    # # read first json file it encounters for now
    # Dir["**/*.json"].each do |json_file|
    #     file = (JSON.parse(File.read(json_file)))["rest"][0]["resource"]
    # end
    # puts (file)
    # add in parsing and storing of data here, hopefully will be able to use data

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
  end
end
