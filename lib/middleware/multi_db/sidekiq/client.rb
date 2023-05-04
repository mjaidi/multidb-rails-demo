module Middleware
  module MultiDb
    module Sidekiq
      class Client
        include ::Sidekiq::ClientMiddleware

        def call(worker_class, job, queue, redis_pool)
          job['shard'] ||= Current.tenant.shard
          yield
        end
      end
    end
  end
end
