# frozen_string_literal: true

# Base class for all page objects
class BasePage
  def element(element_name, *args)
    locator = send("#{element_name}_locator", *args)
    find_element(locator.keys.first, locator.values.first)
  end
end
