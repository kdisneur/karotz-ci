class KarotzRabbitsController < ApplicationController

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
      redirect_to :karotz_rabbits
    else
      render :new
    end
  end

  def update
    if karotz_rabbit.save
      redirect_to :karotz_rabbits
    else
      render :edit
    end
  end
  
  def destroy
    if karotz_rabbit.destroy
      redirect_to :karotz_rabbits
    else
      render :edit
    end
  end

end
