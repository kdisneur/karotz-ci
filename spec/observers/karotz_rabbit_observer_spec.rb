require 'spec_helper'

describe KarotzRabbitObserver do
  let(:karotz_rabbit)          { mock_model(KarotzRabbit) }
  let(:karotz_rabbit_observer) { KarotzRabbitObserver.instance }

  describe 'callbacks' do
    describe '#after_create' do
      before(:each) do
        karotz_rabbit_observer.stub(:generate_token!).with(karotz_rabbit)
        karotz_rabbit_observer.stub(:update_campaign_list).with(karotz_rabbit)
      end

      it 'calls #generate_token!' do
        karotz_rabbit_observer.stub(:generate_token!).with(karotz_rabbit)
        karotz_rabbit_observer.should_receive(:generate_token!).with(karotz_rabbit)

        karotz_rabbit_observer.after_create(karotz_rabbit)
      end

      it 'calls #update_campaign_list' do
        karotz_rabbit_observer.stub(:update_campaign_list).with(karotz_rabbit)
        karotz_rabbit_observer.should_receive(:update_campaign_list).with(karotz_rabbit)

        karotz_rabbit_observer.after_create(karotz_rabbit)
      end
    end
  end
end
