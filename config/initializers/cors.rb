Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins(
      "http://localhost:5173",
      "http://localhost:3000",
      "https://gabrielhr0.github.io",
      /\.vercel\.app\z/,
      "https://apex-six-cyan.vercel.app",
      "https://apex-git-main-gabrielhr0s-projects.vercel.app",
      "https://apex-iq1n3w23k-gabrielhr0s-projects.vercel.app",
      "https://apex-gabrielhr0s-projects.vercel.app"
    )

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      expose: ["Authorization"]
  end
end
