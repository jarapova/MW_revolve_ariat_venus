# In this module we collecting methods for sign in page of ST
require 'capybara/cucumber'


module ST_SignInPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.logged_in_as(user_id)
    # first_name = "//*[@id='ctl00_Body1_firstname']"
    # last_name = "//*[@id='ctl00_Body1_lastname']"

    visit BASE_URL + '/account/login.jsp'
    p  "I am on #{BASE_URL} login page"
    credentials = get_user(user_id)
    page.assert_selector(:xpath, "//a[text()='Forgot Your Password?']")

    find(:id, "email").set(credentials['email'])
    find(:id, "password").set(credentials['password'])
    find(:id,"loginuser").click
    p  "I've put credentials of #{user_id} and clicked to authorize"
    ST_NavigationPage.close_rewards_modal
    page.assert_selector(:xpath, "//a[@class='account-snippet__manage-button']")
    expect(find_all(:xpath,"//a[@class='account-snippet__manage-button']").count).to eq 3
    p  "I've logged in as:"
    p  find(:xpath, "//div[@class='account-snippet__email']").text
  end
  
  def self.expect_login_page
    page.assert_selector(:xpath, "//a[text()='Forgot Your Password?']")
    p  "I am on login page"
  end

end