
module Middleware
  module MultiDb
    module Sidekiq
      class Server
        include ::Sidekiq::ServerMiddleware

        def call(worker_class, job, queue)
          TenantSpecificRecord.establish_connection(ActiveRecord::Base.configurations.find_db_config(job['shard'])) if job['shard']
          yield
        end
      end
    end
  end
end
