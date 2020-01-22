# In this module we collecting methods for hamburger menu page of ST
require 'capybara/cucumber'


module ST_HamburgerMenuPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.click_hamburger_element(hamburger_item_name)
    find(:xpath, %{//ul[@role='menu']//*[contains(text(), "#{hamburger_item_name}")]}).click
    sleep 2
    p "I clicked #{hamburger_item_name} on hamburger menu"
  end

  def self.expect_content(content_name)
  p  "expecting to see #{content_name} in Hamburger menu"
  content_count = find_all(:xpath,'//ul[@role="menu"]/li').count
  expect(content_count).to be >1
  (1..content_count).each {|index| p  find(:xpath,"(//ul[@role='menu']/li)[#{index}]").text}
  p  "Hamburger menu have all expected content"
end
  
def self.navigate_to_category(arg)
  page.assert_selector(:xpath,"//ul[@role='menu']//div[text()='#{arg}']")
  find(:xpath, "//ul[@role='menu']//div[text()='#{arg}']").click
  p  "I've clicked on #{arg} category"
end
def self.navigate_to_subcategory(arg)
  page.assert_selector(:xpath,"//ul[@role='menu']//div[text()='#{arg}']")
  find(:xpath, "//ul[@role='menu']//div[text()='#{arg}']").click
  p  "I've clicked on #{arg} subcategory"
end

def self.navigate_to_my_account
  page.assert_selector(:xpath,"//ul[@role='menu']//*[text()='My Account']")
  find(:xpath, "//ul[@role='menu']//*[text()='My Account']").click
  p  "I've clicked on My account  in hamburger menu"
  end
def self.click_sign_out
  page.assert_selector(:xpath,"//ul[@role='menu']//*[text()='Sign Out']")
  find(:xpath, "//ul[@role='menu']//*[text()='Sign Out']").click
  p  "I've clicked on Sign Out in hamburger menu"
end
end