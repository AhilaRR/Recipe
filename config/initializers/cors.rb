Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://example.com', 'http://www.yoursite.com'  # List of domains that are allowed to make cross-origin requests.
    resource '*',  # Paths that are allowed to be accessed.
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head],
      expose: ['Authorization']  # Exposes Authorization header to the client.
  end
end
