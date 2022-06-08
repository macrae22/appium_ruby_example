require './spec/spec_helper'
require './spec/hook.rb'
require './views/recipeView/recipeView.rb'

describe 'Deeplinks' do

  it 'Can open recipe within app' do

    # Open deeplink
    get("https://cookpad.com/us/recipes/15678199")
    
    # Confirm recipe displayed
    recipeTitle = RecipeView.title_text_view
    expect(recipeTitle.displayed?).to eql true
  end
end