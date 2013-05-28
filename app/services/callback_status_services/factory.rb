module CallbackStatusServices
  class Factory
    def self.build(callback, params)
      sanitized_params = sanitize_params(params)
      class_name(callback).constantize.new.build(sanitized_params)
    end

  private

    def self.class_name(callback)
      "callback_status_services/#{callback.continuous_integration}".camelize
    end

    def self.sanitize_params(params)
      params.delete_if { |key, _| %w(token action controller karotz_rabbit_id).include?(key) }
    end
  end
end
