Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://microverse-rooms.netlify.app', 'http://localhost:3000', 'http://127.0.0.1:3000'
    resource '*', headers: :any, methods: :any 
  end
end
