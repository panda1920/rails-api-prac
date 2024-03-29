require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # enabling cookies
    # https://stackoverflow.com/questions/15342710/adding-cookie-session-store-back-to-rails-api-app
    # if secure: true, no cookies would be sent from rails on http
    config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore, secure: false, key: '_my_app_session'
    config.middleware.use ActionDispatch::Session::CookieStore, secure: true, key: '_my_app_session'
    # config.middleware.use ActionDispatch::ContentSecurityPolicy::Middleware # ?
    config.middleware.insert_after(ActionDispatch::Cookies, ActionDispatch::Session::CookieStore, key: '_my_app_session')

    # config.i18n.default_locale = :ja
    config.i18n.default_locale = :en
  end
end
