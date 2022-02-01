module Login_Email

    def self.email_text_field
        $driver.find_element(:name, 'login_sigin_identity_textfield')
    end

    def self.password_text_field
        $driver.find_element(:xpath, '//XCUIElementTypeSecureTextField[@name="login_signin_password_input_textfield"]')
    end

    def self.sign_in_button
        $driver.find_element(:accessibility_id, 'login_signIn_signIn_button')
    end
end