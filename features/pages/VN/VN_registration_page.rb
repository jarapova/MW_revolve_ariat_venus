# In this module we collecting methods for registration page of VN
require 'capybara/cucumber'


module VN_RegistrationPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.visit_sign_in_page
    visit BASE_URL + '/secure/newaccount.aspx'
    p  "I am on #{BASE_URL} sign up (create account) page"
  end

end