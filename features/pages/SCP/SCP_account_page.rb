require 'capybara/cucumber'

module SCP_AccountPage
extend Capybara::DSL
extend RSpec::Matchers

ACCOUNT_PAGE_PREFIX = "shoecarnival:account_page:"

  def self.expect_content(content_name)
    if content_name == 'account_page_content'
      expect_account_page_content($shoecarnival_stored_information['logged_user'])
    end
  end

  def self.expect_account_page_content(user_id)
    user_info = get_user(user_id)
    page.assert_text(user_info['first_n'].upcase + ' ' + user_info['last_n'].upcase)
    p "I see user name"
    scp_get_account_page_content['base_locators'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + name, locator))
      p "I see #{name}"
    end
  end
end
