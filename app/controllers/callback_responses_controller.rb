class CallbackResponsesController < ::ApplicationController
  def callback
    @callback ||= ::Callback.where(karotz_rabbit_id: params[:karotz_rabbit_id], token: params[:token]).first
  end
  helper_method :callback

  def create
    if callback
      callback_status = CallbackStatusServices::Factory.build(callback, params)
      ci_service      = ContinuousIntegrationServices::Factory.build(callback.continuous_integration)
      ci_service.run(callback.karotz_rabbit, callback_status)

      render nothing: true
    else
      render file: File.join(Rails.root, 'public', '500.html'), status: 500
    end
  end
end
