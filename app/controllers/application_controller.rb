class ApplicationController < ActionController::Base
  before_action :set_tenant

  private

  def set_tenant
    Current.tenant = Tenant.find_by!(shard: TenantSpecificRecord.connection.shard)
  end
end
