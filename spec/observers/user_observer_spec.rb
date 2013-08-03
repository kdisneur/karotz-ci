require 'spec_helper'

describe UserObserver do

  let(:user)          { mock_model(User) }
  let(:user_observer) { UserObserver.instance }

  describe 'callbacks' do
    describe '#after_create' do
      it 'calls #create_in_campaign_list' do
        user_observer.stub(:create_in_campaign_list).with(user)
        user_observer.should_receive(:create_in_campaign_list).with(user)

        user_observer.after_create(user)
      end
    end
  end

  describe 'private methods' do
    describe '#create_in_campaign_list' do

      let(:mail_chimp)       { stub_const('Mailchimp::API', mail_chimp_class) }
      let(:mail_chimp_class) do
        mail_chimp_class = Class.new { def initialize(_); end }
        mail_chimp_class.any_instance.stub(:listSubscribe)

        mail_chimp_class
      end

      context 'when the environment variable is not set' do
        it 'does not call #list_subscribe on mailchimp' do
          ENV['MAILCHIMP_APIKEY'] = nil
          mail_chimp.any_instance.should_not_receive(:listSubscribe)

          user_observer.send(:create_in_campaign_list, user)
        end
      end

      context 'when the environment variable is set' do
        it 'calls #list_subscribe on mailchimp' do
          ENV['MAILCHIMP_APIKEY'] = 'a secreat API key'
          mail_chimp.any_instance.should_receive(:listSubscribe)

          user_observer.send(:create_in_campaign_list, user)
        end
      end
    end
  end

end
