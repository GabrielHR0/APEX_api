# config/initializers/brevo.rb
require 'brevo'

Brevo.configure do |config|
  config.api_key['api-key'] = ENV['BREVO_API_KEY']
  
  # Habilite debugging para ver os logs HTTP
  config.debugging = true
  
  # Configura o logger para output detalhado
  config.logger = Logger.new($stdout)
  config.logger.level = Logger::DEBUG
  
  # Configurações adicionais para logging detalhado
  config.logger.formatter = proc do |severity, datetime, progname, msg|
    "[BREVO-API] #{datetime.strftime('%Y-%m-%d %H:%M:%S')} #{severity}: #{msg}\n"
  end
end

# Adicione também logging para o Faraday (HTTP client usado pelo Brevo)
require 'faraday'
Faraday::Response.register_middleware :logger => Faraday::Response::Logger

# Ou, para ainda mais detalhes:
module Faraday
  class Response::Logger < Middleware
    def call(env)
      start_time = Time.now
      @logger.debug("REQUEST: #{env.method.upcase} #{env.url}") if env.url
      @logger.debug("REQUEST HEADERS: #{env.request_headers.to_json}")
      @logger.debug("REQUEST BODY: #{env.body}") if env.body
      
      @app.call(env).on_complete do |response_env|
        duration = Time.now - start_time
        @logger.debug("RESPONSE STATUS: #{response_env.status}")
        @logger.debug("RESPONSE HEADERS: #{response_env.response_headers.to_json}")
        @logger.debug("RESPONSE BODY: #{response_env.body}")
        @logger.debug("DURATION: #{duration.round(2)}s")
      end
    end
  end
end