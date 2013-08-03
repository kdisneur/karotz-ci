class UserObserver < ActiveRecord::Observer
  def after_create(model)
    create_in_campaign_list(model)
  end

private

  def create_in_campaign_list(model)
    return unless ENV['MAILCHIMP_APIKEY']

    mailchimp = Mailchimp::API.new(ENV['MAILCHIMP_APIKEY'])
    mailchimp.listSubscribe(
      id:                ENV['MAILCHIMP_USER_LIST_ID'],
      email_address:     model.email,
      merge_vars:        { KAROTZ_CNT: 0 },
      email_type:        'html',
      double_optin:      false,
      update_existing:   true,
      replace_interests: false,
      send_welcome:      false
    )
  end
end
