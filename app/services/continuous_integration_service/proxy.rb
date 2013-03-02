module ContinuousIntegrationService
  class Proxy
    def self.get(system_name)
      "continuous_integration_service/#{system_name}".camelize.constantize.new
    end
  end
end
