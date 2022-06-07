module CooksnapSection

    ## https://github.com/facebookarchive/WebDriverAgent/wiki/Class-Chain-Queries-Construction-Rules
    def self.cooksnap_cell
        find_elements(:class_chain, "**/XCUIElementTypeCell[`name == 'inspiration_cooksnap_cell'`]/**XCUIElementTypeCell")
    end

end
