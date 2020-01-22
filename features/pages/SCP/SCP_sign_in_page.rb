require 'capybara/cucumber'

module SCP_SignInPage
extend Capybara::DSL
extend RSpec::Matchers

  SIGN_IN_PAGE_PREFIX = "shoecarnival:sign_in_page:"

  def self.expect_content(content_name)
    if content_name == 'sign_in_page_content'
      expect_sign_in_page_content
    end
  end

  def self.expect_sign_in_page_content
    scp_get_sign_in_page_content['base_locators'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(SIGN_IN_PAGE_PREFIX + name, locator))
      p "I see #{name} on sign in page"
    end
  end

  def self.make_login_as(user_id)
    credentials = get_user(user_id)
    sign_in_locators = scp_get_sign_in_page_content['base_locators']
    find(:xpath, m_ta(SIGN_IN_PAGE_PREFIX + "email_input",
                      sign_in_locators['email_input'])).set(credentials['email'])
    find(:xpath, m_ta(SIGN_IN_PAGE_PREFIX + "password_input",
                      sign_in_locators['password_input'])).set(credentials['password'])
    find(:xpath, m_ta(SIGN_IN_PAGE_PREFIX + "login_button", sign_in_locators['login_button'])).click
    sleep 3
    p "I've put credentials of #{user_id} and clicked to authorize"
    $shoecarnival_stored_information['logged_user'] = user_id
  end

end
