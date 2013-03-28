class CallbacksController < RegisteredController

  def callback
    karotz_rabbit = KarotzRabbit.find(params[:karotz_rabbit_id])
    if (id = params[:id])
      @callback ||= karotz_rabbit.callbacks.find(id)
    else
      @callback ||= karotz_rabbit.callbacks.new
    end

    @callback.attributes = params[:callback]
    @callback
  end
  helper_method :callback

  def create
    if callback.save
      flash[:notice] = 'callback has been successfully created'
      redirect_to(karotz_rabbit_path(callback.karotz_rabbit_id))
    else
      render(:new)
    end
  end

  def destroy
    if callback.destroy
      flash[:notice] = 'callback has been successfully deleted'
      redirect_to(karotz_rabbit_path(callback.karotz_rabbit_id))
    else
      render(:edit)
    end
  end

end
