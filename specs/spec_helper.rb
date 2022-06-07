require 'appium_lib'

def ios_caps
  {
    caps: {
        platformName: 'iOS',
        platformVersion: ENV["IOS_PLATFORM_VERSION"] || '15.2',
        deviceName: ENV["IOS_DEVICE_NAME"] || 'iPhone 12',
        app: '../apps/global.zip',
        automationName: 'XCUITest',
    },
    appium_lib: {
        wait: 10
    }
  }
end

driver = Appium::Driver.new(ios_caps, true)
$touch = Appium::TouchAction.new(@driver)
Appium.promote_appium_methods Object