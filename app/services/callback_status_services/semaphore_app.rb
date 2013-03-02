module CallbackStatusServices
  class SemaphoreApp
    def build(params_sanitized)
      payload_string = params_sanitized.first.first
      payload        = ActiveSupport::JSON.decode(payload_string)
      options        = {
        branch:  payload['branch_name'],
        project: payload['project_name'],
        result:  payload['result'],
      }

      CallbackStatus.new(options)
    end
  end
end
