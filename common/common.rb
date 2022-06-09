require './spec/spec_helper'

module Common

    def self.safe_click(element)
        print "\nWaiting for element to be enabled...\n"
        wait = Selenium::WebDriver::Wait.new :timeout => 10
        wait.until { element.enabled? }
        print "Element enabled!\n"
        element.click
    end

    def self.scroll_to(strategy = :id, element)
        (0...10).each do

            # Get window dimenstions and divide by 2 so we can scroll from the middle of the screen
            size = driver.window_size
            height = size.height / 2
            width = size.width / 2

            #print "Screen size  #{size} \n"

            # Check whether element exists
            print "\nLooking for element(s)...\n"
            ele = exists { find_element(strategy, element).displayed? }
            
            # If element exists, break the loop
            if ele == true
                print "Element displayed!\n"
                break
            else
                # If element doesn't exist, swipe down
                print "Swiping...\n"
                
                # execute_script('mobile: scroll', direction: 'down')
                $touch.swipe(start_x: width, start_y: height, end_x: width, end_y: height - 200, duration: 500).perform
            end
        end
    end

    def self.swipe_to(element1, element2, strategy1 = :id, strategy2 = :id)
        (0...10).each do

            # Find scrollable element
            ele1 = find_element(strategy1, element1)
    
            # Get scrollable element dimensions
            location = ele1.location
            size = ele1.size

            loc_x = location.x
            loc_y = location.y
            width = size.width
            height = size.height
            
            #print "Element location  #{location} \n"
    
            # Check whether element exists
            print "\nLooking for element(s)...\n"
            ele2 = exists { find_element(strategy2, element2).displayed? }
                
            # If element exists, break the loop
            if ele2 == true
                print "Element displayed!\n"
                break
            else
                # If element doesn't exist, swipe left
                print "Swiping left...\n"
                $touch.swipe(start_x: width/2, start_y: loc_y + height/2, end_x: loc_x, end_y: loc_y + height/2, duration: 200).perform
            end
        end    
    end
end
