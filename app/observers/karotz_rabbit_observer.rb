class KarotzRabbitObserver < ActiveRecord::Observer
  def after_create(model)
    update_campaign_list(model)
  end

  def after_destroy(model)
    update_campaign_list(model)
  end

private

  def update_campaign_list(model)
    return unless ENV['MAILCHIMP_APIKEY']

    mailchimp = Mailchimp::API.new(ENV['MAILCHIMP_APIKEY'])
    mailchimp.listSubscribe(
      id:                ENV['MAILCHIMP_USER_LIST_ID'],
      email_address:     model.user.email,
      merge_vars:        { KAROTZ_CNT: model.user.karotz_rabbits.size },
      email_type:        'html',
      double_optin:      false,
      update_existing:   true,
      replace_interests: false,
      send_welcome:      false
    )
  end
end
