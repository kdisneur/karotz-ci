require 'spec_helper'

describe CallbackObserver do
  let(:callback)          { mock_model(Callback) }
  let(:callback_observer) { CallbackObserver.instance }

  describe 'callbacks' do
    describe '#after_create' do
      it 'calls #generate_token!' do
        callback_observer.stub(:generate_token!).with(callback)
        callback_observer.should_receive(:generate_token!).with(callback)

        callback_observer.after_create(callback)
      end
    end
  end

  describe 'private methods' do
    describe '#generate_token!' do
      before(:each) do
        callback.stub(:id).and_return(1337)
        callback.stub(:karotz_rabbit).and_return(mock)
        callback.stub(:karotz_rabbit_id).and_return(42)
        callback.stub_chain(:karotz_rabbit, :user_id).and_return(1024)
        callback.stub(:save)
        callback.stub(:token=)
      end

      it 'create a SHA based on karotz_id, callback_id and user_id' do
        callback.should_receive(:token=).with(Digest::SHA1.hexdigest('42--1337--1024'))
        callback_observer.send(:generate_token!, callback)
      end

      it 'calls #save on the callback model' do
        callback.should_receive(:save)
        callback_observer.send(:generate_token!, callback)
      end
    end
  end
end
