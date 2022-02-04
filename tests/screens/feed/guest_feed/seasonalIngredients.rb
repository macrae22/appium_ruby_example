module SeasonalIngredients

    ## https://github.com/facebookarchive/WebDriverAgent/wiki/Class-Chain-Queries-Construction-Rules
    def self.collection_view
        $driver.find_element(:class_chain, "**/XCUIElementTypeCell[`name == 'inspiration_seasonal_ingredients_ingredient_cell'`]/**/XCUIElementTypeCollectionView")
    end

    def self.feed_show_more_button
        $driver.find_element(:name, "feed_show_more_button")
    end

end
