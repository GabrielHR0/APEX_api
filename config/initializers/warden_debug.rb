
Warden::Manager.before_failure do |env, opts|
  # Isso vai imprimir no terminal onde o servidor está rodando
  Rails.logger.error "\n"
  Rails.logger.error "🛑 WARDEN FAILURE DETECTED 🛑"
  Rails.logger.error "--------------------------------"
  Rails.logger.error "Request Path: #{env['PATH_INFO']}"
  Rails.logger.error "Warden Options: #{opts.inspect}"
  Rails.logger.error "Warden Message: #{env['warden']&.message}"
  Rails.logger.error "Warden User: #{env['warden']&.user}"
  Rails.logger.error "Params: #{env['action_dispatch.request.parameters']}"
  Rails.logger.error "--------------------------------"
  Rails.logger.error "\n"
end
