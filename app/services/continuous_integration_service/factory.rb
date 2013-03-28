module ContinuousIntegrationService
  class Factory
    def self.build(service_name)
      class_name(service_name).constantize.new
    end

  private

    def self.class_name(service_name)
      "continuous_integration_service/#{service_name}".camelize
    end
  end
end
