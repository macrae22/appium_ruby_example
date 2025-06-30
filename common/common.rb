# frozen_string_literal: true

# Common methods used to interact with an app
module Common
  # Swipes left/right on a scrollable element
  def swipe_on_element(scroll_view, direction = 'left', duration = 0.5)
    # Get scrollable element dimensions
    location = scroll_view.location
    size = scroll_view.size

    loc_x = location.x
    loc_y = location.y
    width = size.width
    height = size.height

    # Define swipe start and end points based on direction
    case direction.to_s.downcase
    when 'left'
      # Swipe from right to left
      start_x = loc_x + width * 0.9
      end_x = loc_x + width * 0.1
      y = loc_y + height / 2
      start_y = end_y = y
    when 'right'
      # Swipe from left to right
      start_x = loc_x + width * 0.1
      end_x = loc_x + width * 0.9
      y = loc_y + height / 2
      start_y = end_y = y
    else
      raise "Invalid horizontal swipe direction: #{direction}"
    end

    # Perform swipe action
    action_builder = action
    finger = action_builder.add_pointer_input(:touch, 'finger')
    finger.create_pointer_move(duration: 0, x: start_x.to_i, y: start_y.to_i,
                               origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT)
    finger.create_pointer_down(:left)
    finger.create_pointer_move(duration: duration, x: end_x.to_i, y: end_y.to_i,
                               origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT)
    finger.create_pointer_up(:left)
    action_builder.perform
  end

  # Swipes until it finds the taget element
  def swipe_until_element_is_visible(scroll_view, target_element, direction = 'left', max_swipes = 5)
    max_swipes.times do
      begin
        if target_element.displayed? && target_element.enabled?
          puts 'Target Element is clickable'
          return
        end
      rescue Selenium::WebDriver::Error::NoSuchElementError
        # Element not found, continue swiping
      end
      puts "Swiping #{direction}"
      swipe_on_element(scroll_view, direction)
    end
    raise "Element not found after #{max_swipes} swipes."
  end
end
