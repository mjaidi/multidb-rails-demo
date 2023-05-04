require './lib/middleware/multi_db/sidekiq/client'
require './lib/middleware/multi_db/sidekiq/server'

Sidekiq.configure_server do |config|
  config.client_middleware do |chain|
    chain.add Middleware::MultiDb::Sidekiq::Client
  end

  config.server_middleware do |chain|
    if defined?(::Sidekiq::Batch::Server)
      chain.insert_before ::Sidekiq::Batch::Server, Middleware::MultiDb::Sidekiq::Server
    else
      chain.add Middleware::MultiDb::Sidekiq::Server
    end
  end
end

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add Middleware::MultiDb::Sidekiq::Client
  end
end
