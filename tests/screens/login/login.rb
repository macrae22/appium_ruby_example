module Login

  def self.login_with_email_button
    $driver.find_element(:accessibility_id, 'log_in_with_email_button')
  end
end