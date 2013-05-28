module CallbackStatusServices
  class TravisCi
    def build(params_sanitized)
      payload_string = params_sanitized['payload']
      payload        = ActiveSupport::JSON.decode(payload_string)
      options        = {
        branch:  payload['branch'],
        project: payload['repository']['name'],
        result:  convert_status_message(payload['status_message']),
      }

      CallbackStatus.new(options)
    end

  private

    def convert_status_message(status_message)
      status_message = status_message.downcase
      status_message = 'passed' if status_message == 'fixed'
      status_message
    end
  end
end
