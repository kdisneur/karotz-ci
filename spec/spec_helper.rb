require 'coveralls'
Coveralls.wear!('rails')

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

RSpec.configure do |config|
  config.fixture_path               = "#{::Rails.root}/spec/fixtures"
  config.order                      = 'random'
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
end
