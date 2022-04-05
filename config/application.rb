require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)
module SampleApp
  class Application < Rails::Application
    config.load_defaults 7.0
config.action_view.embed_authenticity_token_in_remote_forms = true
  require File.expand_path('../boot', __FILE__)
  require 'rails/all'
  require 'carrierwave'
if defined?(Bundler)
  # Bundler stuff
end
  end
end
