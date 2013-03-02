class CallbackStatusService
  def build(karotz_rabbit, params)
    params_sanitized = params.delete_if { |key, _| %w(token action controller karotz_rabbit_id).include?(key) }
    "callback_status_services/#{karotz_rabbit.continuous_integration}".camelize.constantize.new.build(params_sanitized)
  end
end
