# frozen_string_literal: true

# Base class for all page objects
class BasePage
  def initialize(driver)
    @driver = driver
  end

  def element(element_name, *args)
    locator = send("#{element_name}_locator", *args)
    @driver.find_element(locator.keys.first, locator.values.first)
  end
end
