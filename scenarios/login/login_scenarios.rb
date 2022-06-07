require './hook.rb'
require '../common/common'
require '../views/explore/inspiration_tab.rb'
require '../scenarios/login/login_scenarios.rb'
require '../views/alert/alert.rb'
require '../views/profile/profile.rb'
require '../views/region_selector/region_selector.rb'
Dir["../views/login/*.rb"].each {|file| require file }

module LoginScenarios

    def self.login(username: "testuser10@cookpad.com", password: "Cookpad12345")

    # Select region
    MainNavBar.you_button.click
    Profile.sign_in_button.click
    Region_Selector.cancel_button.click
        
    # Choose `Login with email`
    Login.login_with_email_button.click

    # Enter Username
    Login_Email.email_text_field.click
    Login_Email.email_text_field.send_keys(username)
 
    # Enter Password
    Login_Email.password_text_field.click
    Login_Email.password_text_field.send_keys(password)

    # Click 'SignIn'
    sign_in_button = Login_Email.sign_in_button
    Common.safe_click(sign_in_button)
    
    # Accept alert if displayed
    Alert.allow()

    # Wait for `explore` nav button to appear
    explore_button = MainNavBar.explore_button
    wait { explore_button }
    end
end
