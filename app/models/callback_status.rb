class CallbackStatus

  attr_accessor :branch, :project, :result

  def initialize(options={})
    self.branch  = options[:branch]
    self.project = options[:project]
    self.result  = options[:result]
  end

  def failed?
    ! self.passed?
  end

  def passed?
    self.result == 'passed'
  end
end
