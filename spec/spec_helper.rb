# frozen_string_literal: true

require 'appium_lib'
require_relative '../common/common'

# Provides access to the Appium driver in RSpec examples
module DriverHelper
  def driver
    RSpec.configuration.driver.driver
  end

  # Returns the platform under test, e.g. 'ios' or 'android'
  def platform
    RSpec.configuration.platform
  end

  def ios?
    platform == 'ios'
  end

  def android?
    platform == 'android'
  end
end

RSpec.configure do |config|
  # Hold the driver instance and the platform under test
  config.add_setting :driver
  config.add_setting :platform

  # Include helpers and custom Common methods
  config.include DriverHelper
  config.include Common

  # Create and start the driver ONCE before all tests begin
  config.before(:suite) do
    platform = (ENV['PLATFORM'] || 'ios').downcase
    RSpec.configuration.platform = platform

    caps = case platform
           when 'ios'
             {
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
           when 'android'
             {
               caps: {
                 platformName: 'Android',
                 platformVersion: ENV['ANDROID_PLATFORM_VERSION'] || '15',
                 deviceName: ENV['ANDROID_DEVICE_NAME'] || 'Android Emulator',
                 app: 'apps/testing-app.apk',
                 automationName: 'UiAutomator2'
               },
               appium_lib: {
                 server_url: 'http://127.0.0.1:4723',
                 wait: 10,
                 connectionRetryCount: 3
               }
             }
           else
             raise "Unsupported PLATFORM: #{platform}. Use 'ios' or 'android'."
           end

    # Create and start the driver, store it in RSpec's configuration
    RSpec.configuration.driver = Appium::Driver.new(caps, true)
    RSpec.configuration.driver.start_driver
  end

  config.after(:suite) do
    # Quit the driver if it exists
    RSpec.configuration.driver&.driver_quit
  end

  config.after(:each) do
    # Terminate and relaunch the app to reset the state
    d = RSpec.configuration.driver&.driver
    app_id = RSpec.configuration.platform == 'android' ? 'com.example.amplecode.testingapp' : 'com.example.apple-amplecode.Testing-App'
    d&.terminate_app(app_id)
    d&.activate_app(app_id)
  end
end
