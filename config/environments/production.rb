require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false

  app_host = ENV.fetch('APP_HOST', 'apex-api-1sbo.onrender.com')
  
  config.asset_host = "https://#{app_host}"
  
  Rails.application.routes.default_url_options = {
    host: app_host,
    protocol: 'https'
  }

  # Habilita o Rails para servir os arquivos da pasta public/uploads
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present? || true
  
  # No Render, deixar false para evitar loops de redirecionamento (o Proxy já trata o SSL)
  config.force_ssl = false

  config.action_controller.perform_caching = true
  config.cache_store = :memory_store
  config.active_storage.service = :local

  # Logs (Otimizados para Stdout/Render)
  config.logger = ActiveSupport::Logger.new($stdout)
    .tap  { |logger| logger.formatter = config.log_formatter }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }
  
  config.log_level = :info
  config.active_support.report_deprecations = false

  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = {
    host: app_host,
    protocol: 'https'
  }

  config.active_record.dump_schema_after_migration = false
end