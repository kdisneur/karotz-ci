module CallbackStatusServices
  class TravisCi
    def build(params_sanitized)
      payload_string = params_sanitized['payload']
      payload        = ActiveSupport::JSON.decode(payload_string)
      options        = {
        branch:  payload['branch'],
        project: payload['repository']['name'],
        result:  payload['status_message'].downcase,
      }

      CallbackStatus.new(options)
    end
  end
end
