class CallbackObserver < ActiveRecord::Observer
  def after_create(model)
    generate_token!(model)
  end

private

  def generate_token!(model)
    model.token = Digest::SHA1.hexdigest("#{model.karotz_rabbit_id}--#{model.id}--#{model.karotz_rabbit.user_id}")
    model.save
  end
end
