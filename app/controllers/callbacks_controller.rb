class CallbacksController < ::ApplicationController

  def karotz_rabbit
    @karotz_rabbit ||= KarotzRabbit.where(id: params[:karotz_rabbit_id], token: params[:token]).first
  end
  helper_method :karotz_rabbit

  def create
    if karotz_rabbit
      callback_status = CallbackStatusService.new.build(karotz_rabbit, params)
      ci_service      = ContinuousIntegrationService::Proxy.get(karotz_rabbit.continuous_integration)
      ci_service.run(karotz_rabbit, callback_status)

      render nothing: true
    else
      render file: File.join(Rails.root, 'public', '500.html'), status: 500
    end
  end
end
