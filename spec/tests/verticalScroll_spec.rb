require './spec/spec_helper'
require './spec/hook'
require './common/common'
require './views/explore/inspiration_tab'
require './views/cooksnap/cooksnapview'
require './views/feed/guest_feed/cooksnapsection'
require './views/login/main_nav_bar'

describe 'Guest user can' do

  it 'View recipe in Inspiration tab' do

    # Wait for Feed to be displayed
    wait { MainNavBar.explore_button }

    # Scroll down and click on recipe
    Common.scroll_to(:accessibility_id, "inspiration_cooksnap_cell")
    CooksnapSection.cooksnap_cell[1].click

    # Assert we are on the recipe screen
    original_recipe_title = CooksnapView.original_recipe_title
    expect(original_recipe_title.displayed?).to eql true
  end
end