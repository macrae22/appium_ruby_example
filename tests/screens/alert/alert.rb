module Alert
     
    def self.allow
        alert = find_element(:predicate, "type == 'XCUIElementTypeAlert'")
        if alert != nil
            $driver.alert_accept
        else
            print("No alert display")
        end
    end
    
end