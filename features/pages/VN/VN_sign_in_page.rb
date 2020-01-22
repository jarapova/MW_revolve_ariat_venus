# In this module we collecting methods for HamburgerMenu page of VN
require 'capybara/cucumber'
require 'capybara'
require 'allure-cucumber'


module VN_SignInPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.make_login_as (user_id)
    visit BASE_URL + '/secure/login.aspx'
    p  "I am on #{BASE_URL} login page"
    credentials = get_user(user_id)
    password_link_locator = vn_get_sign_in_page_locators['forgot_password_link']
    page.assert_selector(:xpath, password_link_locator)
    find(:id, "ctl00_Body1_loginemail").set(credentials['email'])
    find(:id, "ctl00_Body1_loginpassword").set(credentials['password'])
    find(:id,"ctl00_Body1_loginbutton").click
    p  "I've put credentials of #{user_id} and clicked to authorize"
  end

  def self.expect_content(content_name_to_check)
    if content_name_to_check == 'sign_in_page_content'
      locators_to_check_on_page = vn_get_sign_in_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, locator)
        p  "I see #{name} element on sign in page"
      end
    elsif content_name_to_check.include? 'password_lookup_content'
      expect_password_lookup_content
    end
  end

  def self.expect_password_lookup_content
    vn_get_forgot_password_modal_locators.each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name} on forgot password modal"
    end
  end

  def self.click_element(element_name_to_click)
    sign_in_page_elements = vn_get_sign_in_page_locators
    element_locator = sign_in_page_elements[element_name_to_click]
    find(:xpath, element_locator).click
    p   "I've clicked #{element_name_to_click}"
  end

  def self.click_cancel_forgot_password_modal
    cancel_button_locator = vn_get_forgot_password_modal_locators['cancel_button']
    find(:xpath, cancel_button_locator).click
    p "I closed Forgot password modal"
  end
end