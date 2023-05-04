class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  connects_to shards: {
    default: { writing: :shared, reading: :shared_replica },
    tenant_1: { writing: :shared, reading: :shared_replica },
    tenant_2: { writing: :shared, reading: :shared_replica }
  }
end
