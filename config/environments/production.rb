require "active_support/core_ext/integer/time"

Rails.application.configure do
  # 1. Carregamento e Cache
  config.eager_load = true
  config.cache_classes = true # Importante manter true em produção
  config.consider_all_requests_local = true # Mudei para TRUE para você ver o erro no JSON se algo quebrar

  # 2. Assets (Desnecessário para API, mas mantendo a lógica)
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # 3. CORREÇÃO DO SSL (Importante para rede local!)
  # Se for 'true' no ENV, ele força. Se não existir, ele não trava seu acesso local.
  config.force_ssl = ActiveRecord::Type::Boolean.new.cast(ENV["FORCE_SSL"])

  # 4. Rede Local
  config.hosts.clear

  # 5. CONFIGURAÇÃO DE LOGS "VER TUDO"
  config.log_level = :debug
  config.log_formatter = ::Logger::Formatter.new

  # Garante que os logs saiam no terminal (STDOUT) para você ver em tempo real
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Log de SQL (Para ver as queries no banco de dados)
  config.active_record.logger = ActiveSupport::Logger.new(STDOUT)

  # 6. Outros
  config.active_storage.service = :local
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
end
