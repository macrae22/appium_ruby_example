module Alert
     
    # Clicks last button (usually this is the accept button in iOS)
    def self.allow
        alert = find_element(:predicate, "type == 'XCUIElementTypeAlert'")
        if alert != nil
            alert_accept
        else
            print("No alert display")
        end
    end

    # Clicks first button (usually this is the dismss button in iOS)
    def self.dismiss
        alert = find_element(:predicate, "type == 'XCUIElementTypeAlert'")
        if alert != nil
            alert_dismiss
        else
            print("No alert display")
        end
    end
    
end