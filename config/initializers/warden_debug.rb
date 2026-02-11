
Warden::Manager.before_failure do |env, opts|
  # Isso vai imprimir no terminal onde o servidor está rodando
  puts "\n"
  puts "🛑 WARDEN FAILURE DETECTED 🛑"
  puts "--------------------------------"
  puts "Request Path: #{env['PATH_INFO']}"
  puts "Warden Options: #{opts.inspect}"
  puts "Warden Message: #{env['warden']&.message}"
  puts "Warden User: #{env['warden']&.user}"
  puts "Params: #{env['action_dispatch.request.parameters']}"
  puts "--------------------------------"
  puts "\n"
end