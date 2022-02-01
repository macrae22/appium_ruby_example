module MainNavBar

    def self.explore_button
        $driver.find_element(:accessibility_id, 'Home')
    end

    def self.search_button
        $driver.find_element(:accessibility_id, 'Search')
    end

    def self.you_button
        $driver.find_element(:accessibility_id, 'You')
    end
end