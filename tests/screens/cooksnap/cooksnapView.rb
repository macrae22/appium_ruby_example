module CooksnapView

    def self.original_recipe_title
        $driver.find_element(:name, "originalRecipeView_titleLabel")
    end

end
