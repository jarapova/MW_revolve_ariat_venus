require 'capybara/cucumber'


module REV_SignInPage
  extend Capybara::DSL
  extend RSpec::Matchers

  SIGN_IN_PAGE_PREFIX = "revolve:sign_in_page:"

  def self.expect_content(content_name_to_check)
    if content_name_to_check == 'sign_in_page_content'
      expect_sign_in_page_content
    elsif content_name_to_check == 'my_account_sign_in_content'
      expect_save_cart_sign_in_page_content
    end
  end

  def self.expect_sign_in_page_content
    base_locators = rev_get_sign_in_page_content['base_locators']
    base_locators.each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name}"
    end
  end

  def self.expect_save_cart_sign_in_page_content #TODO: try to implement m_ta
    base_locators = rev_get_sign_in_page_content['base_locators']
    base_locators.each do |name, locator|
      page.assert_selector(:xpath, locator) if name != 'my_account_header'
      p "I see #{name}"
    end
    page.assert_selector(:xpath, "//*[contains(text(), 'SAVE MY BAG')]")
    page.assert_selector(:xpath, "//*[contains(text(), 'to sync your bag')]")
    p "I see sign in save bag header text"
  end

  def self.make_login_as(user_id)
    credentials = get_user(user_id)
    sign_in_locators = rev_get_sign_in_page_content['base_locators']

    email_input_locator = sign_in_locators['login_email_input']
    find(:xpath, m_ta(SIGN_IN_PAGE_PREFIX + "login_email_input",
                      email_input_locator)).set(credentials['email'])

    password_input_locator = sign_in_locators['login_password_input']
    find(:xpath, m_ta(SIGN_IN_PAGE_PREFIX + "login_password_input",
                      password_input_locator)).set(credentials['password'])

    sign_in_button_locator = sign_in_locators['sign_in_button']
    find(:xpath, m_ta(SIGN_IN_PAGE_PREFIX + "sign_in_button", sign_in_button_locator)).click
    sleep 3
    p "I've put credentials of #{user_id} and clicked to authorize"
  end
end
