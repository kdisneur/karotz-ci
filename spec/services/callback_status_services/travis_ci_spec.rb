require 'spec_helper'

describe CallbackStatusServices::TravisCi do
  let(:travis_ci) { CallbackStatusServices::TravisCi.new }

  describe '#build' do
    let(:parameters)     { {} }
    let(:payload_string) { mock }
    let(:payload) do
      {
        'branch'         => 'develop',
        'repository'     => { 'name' => 'awesome project' },
        'status_message' => 'passed'
      }
    end

    before(:each) do
      parameters['payload'] = payload_string
      ActiveSupport::JSON.stub(:decode).and_return(payload)
    end

    it 'decodes the payload key of parameter' do
      ActiveSupport::JSON.should_receive(:decode).with(payload_string)

      travis_ci.build(parameters)
    end

    it 'creates a CallbackStatus with options' do
      expected_options = {
        branch:  'develop',
        project: 'awesome project',
        result:  'passed'
      }
      CallbackStatus.should_receive(:new).with(expected_options)

      travis_ci.build(parameters)
    end

    it 'returns a CallbackStatus' do
      callback_status = mock
      CallbackStatus.stub(:new).and_return(callback_status)

      travis_ci.build(parameters).should == callback_status
    end
  end

  describe '#convert_status_message' do
    it 'returns status message in downcase' do
      travis_ci.send(:convert_status_message, 'AwEsOmE').should == 'awesome'
    end

    context 'when status message is "fixed"' do
      it 'returns "passed"' do
        travis_ci.send(:convert_status_message, 'fixed').should == 'passed'
      end
    end
  end
end
