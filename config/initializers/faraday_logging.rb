require 'faraday'
require 'logger'

Faraday.default_connection = Faraday.new do |conn|
  conn.response :logger, Logger.new($stdout), bodies: true
  conn.adapter Faraday.default_adapter
end
