class Login <Appium::Driver

  @login_with_email_button = [:id, 'log_in_with_email_button']
  
  def self.login_with_email_button
    find_element(*@login_with_email_button)
  end

end