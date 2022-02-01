require './specs/spec_helper'
require './hook.rb'
require './common/common'
require './screens/explore/inspiration_tab.rb'
require './scenarios/login/login_scenarios.rb'
require './screens/alert/alert.rb'
require './screens/profile/profile.rb'
require './screens/region_selector/region_selector.rb'
Dir["./screens/login/*.rb"].each {|file| require file }

describe 'Login' do

  it 'via email' do

    # Login natively
    LoginScenarios.login()

  end
end