class TenantSpecificRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to shards: {
    tenant_1: { writing: :tenant_1, reading: :tenant_1 },
    tenant_2: { writing: :tenant_2, reading: :tenant_2 }
  }
end
