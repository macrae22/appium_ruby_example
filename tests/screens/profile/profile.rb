module Profile

    def self.sign_in_button
        $driver.find_element(:accessibility_id, 'UITableViewCellSignIn')
    end
  end