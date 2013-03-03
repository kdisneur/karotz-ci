class KarotzRabbitObserver < ActiveRecord::Observer

  def after_create(model)
    update_campaign_list(model)
  end

  def after_destroy(model)
    update_campaign_list(model)
  end

private

  def update_campaign_list(model)
    if ENV['MAILCHIMP_APIKEY']
      mailchimp = Hominid::API.new(ENV['MAILCHIMP_APIKEY'])
      list_id   = mailchimp.find_list_id_by_name('Users')
      info      = { KAROTZ_CNT: model.user.karotz_rabbits.size }
      result    = mailchimp.list_subscribe(list_id, model.user.email, info, 'html', false, true, false, true)
    end
  end

end