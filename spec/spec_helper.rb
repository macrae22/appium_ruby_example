# frozen_string_literal: true

require 'appium_lib'
require_relative '../common/common'
require_relative '../views/horizontal_scroll/horizontal_scroll_view'

RSpec.configure do |config|
  # Hold the driver instance
  config.add_setting :driver

  # Include your custom Common methods
  config.include Common

  # Create and start the driver ONCE before all tests begin
  config.before(:suite) do
    # Define capabilities
    ios_caps = {
      caps: {
        platformName: 'iOS',
        platformVersion: ENV['IOS_PLATFORM_VERSION'] || '18.1',
        deviceName: ENV['IOS_DEVICE_NAME'] || 'iPhone 16 Pro',
        app: 'TESTapps/testing-app.zip',
        automationName: 'XCUITest'
      },
      appium_lib: {
        server_url: 'http://127.0.0.1:4723',
        wait: 10,
        newCommandTimeout: 180,
        read_timeout: 300,
        wdaLaunchTimeout: 24000
      }
    }

    # Create and start the driver, store it in RSpec's configuration
    RSpec.configuration.driver = Appium::Driver.new(ios_caps, true)
    RSpec.configuration.driver.start_driver

    # Promote Appium methods to RSpec ExampleGroup
    Appium.promote_appium_methods [RSpec::Core::ExampleGroup, Common, HorizontalScrollView]
  end

  config.after(:suite) do
    # Quit the driver if it exists
    RSpec.configuration.driver&.driver_quit
  end
end
