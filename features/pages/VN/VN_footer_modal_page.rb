# In this module we collecting methods for Footer modal  page of VN
require 'capybara/cucumber'


module VN_FooterModalPage
  extend Capybara::DSL
  extend RSpec::Matchers


  def self.expect_content(content_name_to_check)
    locators_to_check_on_page = vn_get_footer_modal_page_locators
    element_locator = locators_to_check_on_page[content_name_to_check]
    if content_name_to_check == 'footer_modal_content'
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, locator)
        p "I see #{name} element on footer modal page"
      end
    else
        page.assert_selector(:xpath, element_locator)
        p  "I see #{content_name_to_check} element on footer modal page"
    end
  end


  def self.click_element(element_name_to_click)
      footer_elements = vn_get_footer_modal_page_locators
      element_locator = footer_elements[element_name_to_click]
      sleep 1
      find(:xpath, element_locator).click
      p "I've clicked #{element_name_to_click}"
  end

  def self.check_third_party_content(content_name)
    if content_name == 'chat_page'
      page.assert_text('Chat support')
      page.assert_text('Help')
      p "I see a chat_page"
    end
  end
end


