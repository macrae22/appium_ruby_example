# frozen_string_literal: true

require_relative '../base_page'

# Page Object for the Home View
class Home < BasePage
  def horizontal_scroll_view_locator
    if android?
      { class_name: 'android.widget.HorizontalScrollView' }
    else
      { class_name: 'XCUIElementTypeScrollView' }
    end
  end

  def vertical_scroll_view_locator
    if android?
      { class_name: 'android.widget.ScrollView' }
    else
      { class_name: 'XCUIElementTypeCollectionView' }
    end
  end

  def horizontal_photo_image_locator(index)
    if android?
      { uiautomator: "new UiSelector().description(\"photo\").instance(#{index - 1})" }
    else
      { class_chain: "**/XCUIElementTypeImage[`name == 'photo'`][#{index}]" }
    end
  end

  def vertical_text_option_locator
    if android?
      { uiautomator: 'new UiSelector().description("ladybug").instance(1)' }
    else
      { class_chain: "**/XCUIElementTypeButton[`name == 'ladybug'`][2]" }
    end
  end

  def ladybug_image_locator
    if android?
      { accessibility_id: 'ladybug' }
    else
      { accessibility_id: 'ladybug.fill' }
    end
  end
end
