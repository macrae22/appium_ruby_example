# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../views/horizontal_scroll/horizontal_scroll_view'

describe 'Horizontal Swipe Example' do
  let(:horizontal_scroll) { HorizontalScrollView.new }

  it '`swipes left to right on element' do
    # Page-object-model
    scroll_view = horizontal_scroll.scroll_view
    scroll_image = horizontal_scroll.photo_image(9)

    swipe_until_element_is_visible(scroll_view, scroll_image)
    scroll_image.click

    image = horizontal_scroll.ladybug_image
    expect(image.displayed?).to be true
  end
end
