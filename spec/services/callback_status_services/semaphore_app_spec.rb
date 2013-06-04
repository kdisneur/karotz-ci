require 'spec_helper'

describe CallbackStatusServices::SemaphoreApp do
  let(:semaphore_app) { CallbackStatusServices::SemaphoreApp.new }

  describe '#build' do
    let(:parameters) { mock }

    before(:each) do
      parameters.stub_chain(:first, :first)
      ActiveSupport::JSON.stub(:decode).and_return({
        'branch_name'  => 'develop',
        'project_name' => 'awesome project',
        'result'       => 'passed'
      })
    end

    it 'gets the payload string from parameters' do
      payloads   = mock
      parameters.stub_chain(:first).and_return(payloads)
      payloads.should_receive(:first).and_return({})

      semaphore_app.build(parameters)
    end

    it 'decodes the payload' do
      payload_string = mock
      parameters.stub_chain(:first, :first).and_return(payload_string)
      ActiveSupport::JSON.should_receive(:decode).with(payload_string).and_return({})

      semaphore_app.build(parameters)
    end

    it 'creates a CallbackStatus with options' do
      expected_options = {
        branch:  'develop',
        project: 'awesome project',
        result:  'passed'
      }
      CallbackStatus.should_receive(:new).with(expected_options)

      semaphore_app.build(parameters)
    end

    it 'returns a CallbackStatus' do
      callback_status = mock
      CallbackStatus.stub(:new).and_return(callback_status)

      semaphore_app.build(parameters).should == callback_status
    end
  end
end
