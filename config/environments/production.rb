require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot (performance).
  config.eager_load = true

  # Disable full error reports.
  config.consider_all_requests_local = false

  # Enable caching.
  config.action_controller.perform_caching = true
  config.cache_store = :memory_store

  config.logger = ActiveSupport::Logger.new($stdout)
  config.log_level = :debug


  # Serve static files if RAILS_SERVE_STATIC_FILES is set.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Force SSL? ❌ NÃO no Render
  # config.force_ssl = true

  # Logging
  config.log_level = :info

  # Active Storage (local ok se não usar upload)
  config.active_storage.service = :local

  # Emails
  config.action_mailer.perform_caching = false
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

  # config/environments/production.rb
  config.cache_store = :redis_cache_store, {
    url: ENV['REDIS_URL'],
    expires_in: 1.hour
  }


  # 🔴 MUITO IMPORTANTE
  config.action_mailer.default_url_options = {
    host: ENV['APP_HOST'],
    protocol: 'https'
  }

  # Active Record
  config.active_record.migration_error = false

  # Logs
  config.active_support.report_deprecations = false
end
