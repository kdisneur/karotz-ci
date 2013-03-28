require 'spec_helper'

describe ContinuousIntegrationService::Factory do

  let(:klass) { ContinuousIntegrationService::Factory }

  describe '.build' do
    after(:each)  do
      # HACK: needs to remove class and reload it cleanly for next specs in the suite.
      ContinuousIntegrationService.send(:remove_const, 'AwesomeService')
    end

    before(:each) do
      class ContinuousIntegrationService::AwesomeService; end
    end

    it 'initializes a class like ContinuousIntegrationService::<Service>' do
      service_name = 'awesome_service'
      klass.build(service_name).should be_instance_of(ContinuousIntegrationService::AwesomeService)
    end
  end

  describe 'private methods' do
    describe '.class_name' do
      it 'returns a "service_name" camelized, scoped in the "continuous_integration"' do
        klass.send(:class_name, 'awesome_service').should == 'ContinuousIntegrationService::AwesomeService'
      end
    end
  end
end
