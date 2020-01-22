# In this module we collecting methods for all common page of ANNIESELKE
require 'capybara/cucumber'


module AN_AllPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.expect_user_is_on_page(arg)
    arg = arg.upcase
    page.assert_selector(:xpath, "//div[@data-page='Category']//h5")
    p  "I appear on subcategory #{arg} page"
    p  find(:xpath, "//div[@data-page='Category']//h5").text == arg
  end

  def self.isAnnie?
    # PWA == 'annie'
    false
  end

end
