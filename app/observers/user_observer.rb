class UserObserver < ActiveRecord::Observer

  def after_create(model)
    if ENV['MAILCHIMP_APIKEY']
      mailchimp = Hominid::API.new(ENV['MAILCHIMP_APIKEY'])
      list_id   = mailchimp.find_list_id_by_name('Users')
      info      = { KAROTZ_CNT: 0 }
      result    = mailchimp.list_subscribe(list_id, model.email, info, 'html', false, true, false, true)
    end
  end

end
