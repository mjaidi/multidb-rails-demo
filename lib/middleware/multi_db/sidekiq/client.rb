module Middleware
  module MultiDb
    module Sidekiq
      class Client
        def initialize(optional_args = nil)
          @args = optional_args
        end

        def call(worker_class, job, queue, redis_pool)
          job['shard'] ||= Current.tenant.shard
          yield
        end
      end
    end
  end
end
