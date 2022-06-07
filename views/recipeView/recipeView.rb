module RecipeView

    def self.title_text_view
        find_element(:accessibility_id, 'recipeViewerRecipeTitleLabel')
    end
end