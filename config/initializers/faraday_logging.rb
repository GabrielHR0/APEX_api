# config/initializers/faraday_logging.rb
require 'faraday'

class Faraday::DetailedLogger < Faraday::Middleware
  def initialize(app, logger = nil)
    super(app)
    @logger = logger || Logger.new($stdout)
  end

  def call(env)
    start_time = Time.now
    
    # Log da requisição
    @logger.info("=== BREVO API REQUEST ===")
    @logger.info("URL: #{env.method.upcase} #{env.url}")
    @logger.info("Headers: #{env.request_headers.to_json}")
    @logger.info("Body: #{env.body.to_json}") if env.body
    
    @app.call(env).on_complete do |response_env|
      duration = Time.now - start_time
      
      # Log da resposta
      @logger.info("=== BREVO API RESPONSE ===")
      @logger.info("Status: #{response_env.status}")
      @logger.info("Duration: #{duration.round(3)}s")
      @logger.info("Response Headers: #{response_env.response_headers.to_json}")
      @logger.info("Response Body: #{response_env.body}")
      @logger.info("=========================")
    end
  end
end

# Aplica o logger detalhado
Brevo.configure do |config|
  config.api_key['api-key'] = ENV['BREVO_API_KEY']
  config.connection_options = {
    builder: Faraday::RackBuilder.new do |builder|
      builder.request :url_encoded
      builder.use Faraday::DetailedLogger, Logger.new($stdout)
      builder.adapter Faraday.default_adapter
    end
  }
end