Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins(
      "http://localhost:5173",
      "http://localhost:3000",
      "https://gabrielhr0.github.io",
      "https://apex-7okmnvk7r-gabrielhr0s-projects.vercel.app",
      "https://apex-e9ovljk6w-gabrielhr0s-projects.vercel.app"
    )

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      expose: ["Authorization"]
  end
end
