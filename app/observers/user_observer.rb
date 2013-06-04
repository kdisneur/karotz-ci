class UserObserver < ActiveRecord::Observer
  def after_create(model)
    create_in_campaign_list(model)
  end

private

  def create_in_campaign_list(model)
    return unless ENV['MAILCHIMP_APIKEY']

    mailchimp = Hominid::API.new(ENV['MAILCHIMP_APIKEY'])
    list_id   = mailchimp.find_list_id_by_name('Users')
    info      = { KAROTZ_CNT: 0 }
    mailchimp.list_subscribe(list_id, model.email, info, 'html', false, true, false, false)
  end
end
