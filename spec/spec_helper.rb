# frozen_string_literal: true

require 'appium_lib'
require_relative '../common/common'

# Provides access to the Appium driver in RSpec examples
module DriverHelper
  def driver
    RSpec.configuration.driver.driver
  end
end

RSpec.configure do |config|
  # Hold the driver instance
  config.add_setting :driver

  # Include helpers and custom Common methods
  config.include DriverHelper
  config.include Common

  # Create and start the driver ONCE before all tests begin
  config.before(:suite) do
    # Define capabilities
    ios_caps = {
      caps: {
        platformName: 'iOS',
        platformVersion: ENV['IOS_PLATFORM_VERSION'] || '18.1',
        deviceName: ENV['IOS_DEVICE_NAME'] || 'iPhone SE (3rd generation)',
        app: 'apps/testing-app.zip',
        automationName: 'XCUITest'
      },
      appium_lib: {
        server_url: 'http://127.0.0.1:4723',
        wait: 10,
        connectionRetryCount: 3
      }
    }

    # Create and start the driver, store it in RSpec's configuration
    RSpec.configuration.driver = Appium::Driver.new(ios_caps, true)
    RSpec.configuration.driver.start_driver
  end

  config.after(:suite) do
    # Quit the driver if it exists
    RSpec.configuration.driver&.driver_quit
  end

  config.after(:each) do
    # Terminate and relaunch the app to reset the state
    d = RSpec.configuration.driver&.driver
    d&.terminate_app('com.example.apple-amplecode.Testing-App')
    d&.activate_app('com.example.apple-amplecode.Testing-App')
  end
end
