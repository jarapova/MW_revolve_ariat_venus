# In this module we collect methods for the HamburgerMenu page of ANNIE SELKE
require 'capybara/cucumber'


module AN_HamburgerMenuPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.expect_content(content_name)
    p  "expecting to see #{content_name} in Hamburger menu"
    p  find(:xpath, "//a[text()='Login']").text
    p  find(:xpath, "//div[text()='Rugs']/parent::li").text
    p  find(:xpath, "//div[text()='Bedding']/parent::li").text
    p  find(:xpath, "//div[text()='Furniture']/parent::li").text
    p  find(:xpath, "//div[text()='Décor & Pillows']/parent::li").text
    p  find(:xpath, "//div[text()='Bath']/parent::li").text
    p  find(:xpath, "//div[text()='Window Treatments']/parent::li").text
    p  find(:xpath, "//div[text()='Apparel']/parent::li").text
    p  find(:xpath, "//div[text()='Collections']/parent::li").text
    p  find(:xpath, "//div[text()='GIFTS']/parent::li").text
    p  find(:xpath, "//div[text()='Sale']/parent::li").text
    p  find(:xpath, "//div[text()='The Company']").text
    p  find(:xpath, "//div[text()='Stores']").text
    p  find(:xpath, "//div[text()='Help and Info']").text
    p  find(:xpath, "//div[text()='Contact Us']").text
    p  find(:xpath, "//a[text()='annie selke']").text
    p  find(:xpath, "//a[text()='pine cone hill']").text
    p  find(:xpath, "//a[text()='dash & albert']").text
    p  find(:xpath, "//a[text()='the outlet']").text
    p  find(:xpath, "//a[text()='ideas and inspirations']").text
    p  find(:xpath, "//a[text()='catalog']").text
    p  "Hamburger menu have all expected content!"
  end

  def self.navigate_to_subcategory_from_category_hamburger(subcategory_name, category_name)
    find(:xpath, "//div[text()='#{category_name}']/parent::li").click
    p  "I've clicked on #{category_name}"
    find(:xpath, "//div[text()='#{subcategory_name}']/parent::li").click
    p  "I've clicked on #{subcategory_name}"
  end

  def self.navigate_to_category(category_name)
    find(:xpath, "//div[text()='#{category_name}']/parent::li").click
    p  "I've clicked on #{category_name}"
  end

  def self.navigate_to_subcategory(subcategory_name)
    find(:xpath, "//div[text()='#{subcategory_name}']/parent::li").click
    p  "I've clicked on #{subcategory_name}"
  end

  def self.click_on_login_in_the_top_of_hamburger_menu
    sleep 2
    find(:xpath, "//a[text()='Login']").click
    p  "I've clicked on Login"
  end

  def self.expect_account_tab_in_hamburger_menu
    sleep 2
    page.assert_selector(:xpath, "//a[text()='My Account']")
    page.assert_selector(:xpath, "//a[text()='Logout']")
    p  "I see account tab in the hamburger menu"
  end

  def self.click_on_my_account_in_the_hamburger_menu
    find(:xpath, "//a[text()='My Account']").click
    p  "I've clicked on the My Account link in the hamburger menu"
  end

  def self.click_on_logout_in_the_hamburger_menu
    find(:xpath, "//a[text()='Logout']").click
    p  "I've clicked on the logout link in the hamburger menu"
  end

  def self.hamburger_footer_link(hamburger_footer)
    find(:xpath, "//span/a[text()='#{hamburger_footer}']").click
    p  "I've clicked on the #{hamburger_footer} link, at the bottom of the hamburger menu"
  end

  def self.navigate_to_accordion(accodion_name)
    find(:xpath, "//div[text()='#{accodion_name}']/parent::h6").click
    p  "I've clicked on #{accodion_name}"

  end

  def self.navigate_to_accordion_subcategory(accodion_subcategory_name)
    find(:xpath, "//a[text()='#{accodion_subcategory_name}']").click
    p  "I've clicked on #{accodion_subcategory_name}"

  end

  def self.navigate_to_accordion_in_subcategory(accodion_in_subcategory_name)
    find(:xpath, "//div[text()='#{accodion_in_subcategory_name}']").click
    p  "I've clicked on #{accodion_in_subcategory_name}"
  end
end
