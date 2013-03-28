require 'spec_helper'

describe KarotzRabbitObserver do
  let(:karotz_rabbit)          { mock_model(KarotzRabbit) }
  let(:karotz_rabbit_observer) { KarotzRabbitObserver.instance }

  describe 'callbacks' do
    describe '#after_create' do
      before(:each) { karotz_rabbit_observer.stub(:update_campaign_list).with(karotz_rabbit) }

      it 'calls #update_campaign_list' do
        karotz_rabbit_observer.stub(:update_campaign_list).with(karotz_rabbit)
        karotz_rabbit_observer.should_receive(:update_campaign_list).with(karotz_rabbit)

        karotz_rabbit_observer.after_create(karotz_rabbit)
      end
    end

    describe '#after_destroy' do
      before(:each) { karotz_rabbit_observer.stub(:update_campaign_list).with(karotz_rabbit) }

      it 'calls #update_campaign_list' do
        karotz_rabbit_observer.stub(:update_campaign_list).with(karotz_rabbit)
        karotz_rabbit_observer.should_receive(:update_campaign_list).with(karotz_rabbit)

        karotz_rabbit_observer.after_destroy(karotz_rabbit)
      end
    end
  end
end
