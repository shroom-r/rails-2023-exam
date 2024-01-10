require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :rack_test
end

# # Remove "Capybara starting Puma..." test logs
# Capybara.server = :puma, { Silent: true }
