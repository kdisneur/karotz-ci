require 'spec_helper'

describe CallbackStatusServices::Factory do

  let(:callback) { mock }
  let(:klass)    { CallbackStatusServices::Factory }

  describe '.build' do
    after(:each)  do
      # HACK: needs to remove class and reload it cleanly for next specs in the suite.
      CallbackStatusServices.send(:remove_const, 'AwesomeService')
    end

    before(:each) do
      class CallbackStatusServices::AwesomeService;
        def build(params); end
      end
    end

    it 'calls #build on CallbackStatusServices::<Service>' do
      callback.stub(:continuous_integration).and_return('awesome_service')
      CallbackStatusServices::AwesomeService.any_instance.should_receive(:build)

      klass.build(callback, {})
    end
  end

  describe 'private methods' do
    describe '.class_name' do
      it 'returns a "callback" camelized, scoped in the "callback_status_services"' do
        callback.stub(:continuous_integration).and_return('awesome_service')
        klass.send(:class_name, callback).should == 'CallbackStatusServices::AwesomeService'
      end
    end

    describe '.sanitize_params' do
      %w(token action controller karotz_rabbit_id).each do |key|
        context "when params contain a key '#{key}'" do
          it "returns hash without the key '#{key}'" do
            params = { first_key: 'value', "#{key}" => 'other_value' }
            klass.send(:sanitize_params, params).should == { first_key: 'value' }
          end
        end
      end

      context "when params contain a key 'awesome_key'" do
        it "returns hash with all the keys" do
          params = { first_key: 'value', 'awesome_key' => 'other_value' }
          klass.send(:sanitize_params, params).should == params
        end
      end
    end
  end
end
