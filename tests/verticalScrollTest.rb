require './specs/spec_helper'
require './hook.rb'
require './common/common'
require './screens/explore/inspiration_tab.rb'
require './screens/cooksnap/cooksnapview.rb'
require './screens/feed/guest_feed/cooksnapsection.rb'
Dir["./screens/login/*.rb"].each {|file| require file }

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