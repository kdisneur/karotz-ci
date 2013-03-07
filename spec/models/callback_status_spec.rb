require 'spec_helper'

describe CallbackStatus do

  let(:callback_status) { CallbackStatus.new }

  describe '#failed?' do
    context 'when result is "passed"' do
      it 'returns false' do
        callback_status.result = 'passed'
        callback_status.failed?.should == false
      end
    end

    context 'when result is not "passed"' do
      it 'returns true' do
        callback_status.result = 'other value'
        callback_status.failed?.should == true
      end
    end
  end

  describe '#passed?' do
    context 'when result is "passed"' do
      it 'returns true' do
        callback_status.result = 'passed'
        callback_status.passed?.should == true
      end
    end

    context 'when result is not "passed"' do
      it 'returns false' do
        callback_status.result = 'other value'
        callback_status.passed?.should == false
      end
    end
  end
end
