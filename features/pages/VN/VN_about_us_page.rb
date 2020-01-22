# In this module we collecting methods for AboutUs  page of VN
require 'capybara/cucumber'




module VN_AboutUsPage
  extend Capybara::DSL
  extend RSpec::Matchers


  def  self.expect_content_on_about_us_page(content_name_to_check)
    if content_name_to_check == 'about_us_page_content'
      locators_to_check_on_page = vn_get_about_us_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, locator)
        p  "I see #{name} element on about us page"
      end
      text_to_check_on_page = vn_get_about_us_page_text
      text_to_check_on_page.each do |(name, text)|
        page.assert_selector(:xpath, "//*[text()='#{text}']")
        p  "I see <#{name}> text element on about us page"
      end
    end
  end
end