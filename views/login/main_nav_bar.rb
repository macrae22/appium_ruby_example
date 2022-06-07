module MainNavBar

    def self.explore_button
        find_element(:accessibility_id, 'Home')
    end

    def self.search_button
        find_element(:accessibility_id, 'Search')
    end

    def self.you_button
        find_element(:accessibility_id, 'You')
    end
end