# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../views/home/home'

describe 'Swipe Examples' do
  let(:home) { Home.new }

  it 'Horizontal view example' do
    scroll_view = home.element(:horizontal_scroll_view)

    scroll_image = swipe_until_element_is_visible(scroll_view, home.horizontal_photo_image_locator(9))
    scroll_image.click

    image = home.element(:ladybug_image)
    expect(image.displayed?).to be true
  end

  it 'Vertical view example' do
    scroll_view = home.element(:vertical_scroll_view)

    option = swipe_until_element_is_visible(scroll_view, home.vertical_text_option_locator, 'up')
    option.click

    image = home.element(:ladybug_image)
    expect(image.displayed?).to be true
  end
end
