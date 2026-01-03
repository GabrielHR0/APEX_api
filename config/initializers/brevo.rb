require 'brevo'

Brevo.configure do |config|
  config.api_key['api-key'] = ENV['BREVO_API_KEY']
  config.debugging = true
  config.logger = Logger.new($stdout)
  config.logger.level = Logger::DEBUG
end
