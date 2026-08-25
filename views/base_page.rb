# frozen_string_literal: true

# Base class for all page objects
class BasePage
  def initialize(driver, platform: (ENV['PLATFORM'] || 'ios').downcase)
    @driver = driver
    @platform = platform
  end

  def element(element_name, *args)
    locator = send("#{element_name}_locator", *args)
    @driver.find_element(locator.keys.first, locator.values.first)
  end

  private

  def ios?
    @platform == 'ios'
  end

  def android?
    @platform == 'android'
  end
end
