require "active_support/core_ext/integer/time"

Rails.application.configure do
  # basic production defaults
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.cache_store = :memory_store

  # public files (assets/uploads) – enable only when needed
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # SSL termination handled by proxy or leave to Rails if variable set
  config.force_ssl = ENV["FORCE_SSL"].present?

  # não há configuração de host fixa; o Rails utiliza o
  # cabeçalho Host da requisição para construir URLs completas.
  # Se no futuro precisar gerar links em background/por e-mail,
  # basta definir ENV["APP_HOST"] e recriar este bloco.

  # storage, logging, and other misc
  config.active_storage.service = :local
  config.logger = ActiveSupport::TaggedLogging.new(
    ActiveSupport::Logger.new($stdout).tap { |l| l.formatter = config.log_formatter }
  )
  config.log_level = :info
  config.active_support.report_deprecations = false

  config.active_record.dump_schema_after_migration = false
end