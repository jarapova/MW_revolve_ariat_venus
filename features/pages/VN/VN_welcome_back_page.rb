# In this module we collecting methods for Welcome Back page of VN
require 'capybara/cucumber'




module VN_WelcomeBackPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def  self.expect_content_on_welcome_back_page(content_name_to_check)
    if content_name_to_check == 'welcome_back_page_content'
      locators_to_check_on_page = vn_get_welcome_back_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, locator)
        p  "I see #{name} element on contact us page"
      end
    end
  end
end