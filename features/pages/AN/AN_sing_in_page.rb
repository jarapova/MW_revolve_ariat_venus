# In this module we collect methods for the sign in page of ANNIE SELKE
require 'capybara/cucumber'
require 'capybara'



module AN_SignInPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.make_login_as (user_id)
    visit BASE_URL + '/secure/login.aspx'
    p "I am on #{BASE_URL} login page"
    credentials = get_user(user_id)
    page.assert_selector(:xpath, "//span[text()='Forget your password?']/following-sibling::a[text()='Click Here']")

    find(:id, "ctl00_Body1_loginemail").set(credentials['email'])
    find(:id, "ctl00_Body1_loginpassword").set(credentials['password'])
    find(:id,"ctl00_Body1_loginbutton").click
    p "I've put credentials of #{user_id} and clicked to authorize"
  end

  def self.logged_in_as(user_id)
    credentials = get_user(user_id)
    find(:id, "j_username").set(credentials['email'])
    find(:id, "j_password").set(credentials['password'])
    find(:xpath,"//button[text()='Login']").click
    p  "I've put credentials of #{user_id} and clicked to authorize"
  end


  def self.user_on_sign_in_page
    sleep 5
    page.assert_selector(:xpath, "//a[text()='Oops! I forgot my password.']")
    p  "I'm on Sign in Page"
  end

end
