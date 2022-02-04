module Search

    def self.location_permissions_intercept_drawer
        $driver.find_element(:name, 'drawerIntercept_mainButton')
    end

end