class KarotzRabbitsController < RegisteredController

  def karotz_rabbit
    if (id = params[:id])
      @karotz_rabbit ||= KarotzRabbit.find(id)
    else
      @karotz_rabbit ||= KarotzRabbit.new
    end

    @karotz_rabbit.attributes = params[:karotz_rabbit]
    @karotz_rabbit
  end
  helper_method :karotz_rabbit

  def create
    karotz_rabbit.user = current_user

    if karotz_rabbit.save
      flash[:notice] = "#{karotz_rabbit.name} has been successfully created"
      redirect_to(edit_karotz_rabbit_path(karotz_rabbit))
    else
      render(:new)
    end
  end

  def update
    if karotz_rabbit.save
      flash[:notice] = "#{karotz_rabbit.name} has been successfully updated"
      redirect_to(edit_karotz_rabbit_path(karotz_rabbit))
    else
      render(:edit)
    end
  end

  def destroy
    if karotz_rabbit.destroy
      flash[:notice] = "#{karotz_rabbit.name} has been successfully deleted"
      redirect_to(:karotz_rabbits)
    else
      render(:edit)
    end
  end

end
