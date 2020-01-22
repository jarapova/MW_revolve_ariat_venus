# In this module we collecting methods for VenusCard  page of VN
require 'capybara/cucumber'




module VN_VenusCardPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.expect_content_on_venus_card_page (content_name_to_check)
    if content_name_to_check == 'venus_card_page_content'
      locators_to_check_on_page = vn_get_venus_card_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, locator)
        p  "I see #{name} element on card page"
      end
      text_to_check_on_page = vn_get_venus_card_page_text
      text_to_check_on_page.each do |(name, text)|
        page.assert_selector(:xpath, "//*[text()='#{text}']")
        p  "I see <#{name}> text element on card page"
      end
    end
  end

end