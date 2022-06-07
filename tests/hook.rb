RSpec.configure do |config|
    
    config.before(:all) do
        start_driver
    end

    config.after(:all) do
        driver_quit
    end    
  end