
module Middleware
  module MultiDb
    module Sidekiq
      class Server
        def initialize(optional_args = nil)
          @args = optional_args
        end

        def call(worker_class, job, queue)
          if job['shard']
            TenantSpecificRecord.establish_connection(ActiveRecord::Base.configurations.find_db_config(job['shard']))
            yield
          end
          yield
        end
      end
    end
  end
end
