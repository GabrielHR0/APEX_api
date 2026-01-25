Devise.setup do |config|
  require 'devise/orm/active_record'

  config.authentication_keys = [:email]
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.password_length = 6..128
  config.reconfirmable = false

  config.navigational_formats = []
  config.skip_session_storage = [:http_auth, :params_auth]

  config.warden do |manager|
    manager.scope_defaults :user, store: false
  end


config.jwt do |jwt|
    jwt.secret = ENV.fetch('DEVISE_JWT_SECRET_KEY')
    jwt.dispatch_requests = [
      ['POST', %r{^/api/v1/login$}],
      ['POST', %r{^/api/v1/signup$}]
    ]

    jwt.revocation_requests = [
      ['DELETE', %r{^/api/v1/logout$}]
    ]
    jwt.expiration_time = 24.hours.to_i
  end
end
