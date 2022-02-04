require './specs/spec_helper'
require './hook.rb'
require './common/common'
require './screens/alert/alert'
require './screens/device/device'
require './screens/search/search'
require './screens/feed/guest_feed/seasonalIngredients'
Dir["./screens/login/*.rb"].each {|file| require file }

describe 'Seasonal Ingredients' do

    it '`View all` recipes button opens search' do
    
      # Wait for Feed to be displayed
      wait { MainNavBar.explore_button }
  
      # Wait for seasonal ingredients to display within Feed
      exists { SeasonalIngredients.collection_view.displayed? }
      
      # Swipe horizontally to `view all recipes` button
      Common.swipe_to("**/XCUIElementTypeCell[`name == 'inspiration_seasonal_ingredients_ingredient_cell'`]/**/XCUIElementTypeCollectionView", "feed_show_more_button", :class_chain, :name)

      # Click `view more buttton`
      SeasonalIngredients.feed_show_more_button.click()

      # Accept location permissions
      Search.location_permissions_intercept_drawer.click()

      # Dismiss device location permissions
      Alert.dismiss

      # Confirm `search nav` is enabled
      search_nav_button = MainNavBar.search_button
      expect(search_nav_button.enabled?).to eql true
      end
end
