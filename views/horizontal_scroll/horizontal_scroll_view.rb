# frozen_string_literal: true

# Page Object for the Horizontal Scroll View
class HorizontalScrollView
  def scroll_view
    find_element(:class_name, 'XCUIElementTypeScrollView')
  end

  def photo_image(index)
    find_element(:class_chain, "**/XCUIElementTypeImage[`name == \"photo\"`][#{index}]")
  end

  def ladybug_image
    find_element(:accessibility_id, 'ladybug.fill')
  end
end
