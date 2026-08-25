# frozen_string_literal: true

require_relative '../base_page'

# Page Object for the Home View
class Home < BasePage
  def horizontal_scroll_view_locator
    { class_name: 'XCUIElementTypeScrollView' }
  end

  def vertical_scroll_view_locator
    { class_name: 'XCUIElementTypeCollectionView' }
  end

  def horizontal_photo_image_locator(index)
    { class_chain: "**/XCUIElementTypeImage[`name == 'photo'`][#{index}]" }
  end

  def vertical_text_option_locator
    { class_chain: "**/XCUIElementTypeButton[`name == 'ladybug'`][2]" }
  end

  def ladybug_image_locator
    { accessibility_id: 'ladybug.fill' }
  end
end
