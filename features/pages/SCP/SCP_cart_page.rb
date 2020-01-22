require 'capybara/cucumber'

module SCP_CartPage
extend Capybara::DSL
extend RSpec::Matchers

CART_PAGE_PREFIX = "shoecarnival:cart_page:"

  def self.expect_content(content_name)
    if content_name == 'empty_cart_page_content'
      expect_empty_cart_page_content
    end
  end

  def self.expect_empty_cart_page_content
    ta_prefix = CART_PAGE_PREFIX + "empty_cart:"
    scp_get_cart_page_content['empty_cart_page_locators'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(ta_prefix + name, locator))
      p "I see #{name}"
    end
  end

end
