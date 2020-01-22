# In this module we collecting methods for account page of ST
require 'capybara/cucumber'


module ST_AccountPage
  extend Capybara::DSL
  extend RSpec::Matchers
def self.expect_my_account_page
  page.assert_selector(:xpath, "//a[@class='account-snippet__manage-button']")
  expect(find_all(:xpath,"//a[@class='account-snippet__manage-button']").count).to eq 3
  p  "I've logged in as:"
  p  find(:xpath, "//div[@class='account-snippet__email']").text
end
end