# In this module we collecting methods for homepage page of ST
require 'capybara/cucumber'



module ST_HomePage

  extend Capybara::DSL
  extend RSpec::Matchers
  def self.visit_home_page
    visit BASE_URL
    p  "I am on #{BASE_URL} home page"
    p  "ST_HomePage"
  end
end



