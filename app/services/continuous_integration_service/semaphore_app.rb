require 'karotz'
require 'karotz/color'
require 'karotz/language'

module ContinuousIntegrationService
  class SemaphoreApp
    def run(karotz_rabbit, callback_status)
      Karotz::Configuration.configure do |config|
        config.install_id = karotz_rabbit.install_id
        config.api_key    = ENV['KAROTZ_APIKEY']
        config.secret     = ENV['KAROTZ_SECRET']
      end

      Karotz::Client.session do |karotz|
        if callback_status.passed?
          color   = Karotz::Color::GREEN
          message = 'success for'
        else
          color   = Karotz::Color::RED
          message = 'failures on'
        end
        message << " #{callback_status.project}"

        karotz.light(color: color, period: 10 * 1000)
        karotz.say(text: message)
        sleep 10
      end

    end
  end
end
