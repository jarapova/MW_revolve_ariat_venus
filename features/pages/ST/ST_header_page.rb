# In this module we collecting methods for header page of ST
require 'capybara/cucumber'


module ST_HeaderPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.click_element(element_name, sleep_after = 0)
    pending
  end

  def self.hamburger_icon_click
    find(:xpath, "//button[@aria-label='Menu']").click
    sleep 3
    p  "I've clicked on Hamburger icon in header"
  end
  def self.logo_click
    moovweb_logo_true = find_all(:xpath, "//a[contains(.,'brand logo')]").count
    default_logo_true = find_all(:xpath, "//a[@class='m-header__logo']").count
    if moovweb_logo_true == 1
      find(:xpath, "//a[contains(.,'brand logo')]").click
    elsif default_logo_true == 1
      find(:xpath, "//a[@class='m-header__logo']").click
    elsif
      p  "I don't see moovweb or default logo in header"
    end
    p  "After click on logo I was navigated to: #{URI.parse(current_url)}"
  end

  def self.cart_icon_click
    page.assert_selector(:xpath, "//button[@aria-label='Cart']")
    find(:xpath, "//button[@aria-label='Cart']").click

  end
end