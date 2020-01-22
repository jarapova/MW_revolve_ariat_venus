# In this module we collecting methods for Header page of ANNIE SELKE
require 'capybara/cucumber'


module AN_HeaderPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.click_element(element_name, sleep_after = 0)
    pending
  end

  def self.select_my_acc_icon
    p  "I am expect account icon"
    page.assert_selector(:xpath, "(//button[@aria-label='Account'])[1]")
    p  'I see account icon in header'
    find(:xpath, "(//button[@aria-label='Account'])[1]").click
    p  "Account icon clicked"
  end

  def self.expect_account_modal
    begin
      sleep 5
      find(:xpath, "(//button[@aria-label='Account'])[1]").click
    end while have_selector?(:xpath,"(//*[@id='simple-menu']//ul[@role='menu'])[1]") == true
    page.assert_selector(:xpath,"(//*[@id='simple-menu']//ul[@role='menu'])[1]")
    p  "Account icon modal is opened. I see modal"
  end

  def self.account_modal_navigate_to(arg)
    p  "I expect to have #{arg} in modal"
    page.assert_selector(:xpath,"(//*[@id='simple-menu']//*[text()='#{arg}'])[2]")
    find(:xpath,  "(//*[@id='simple-menu']//a[text()='#{arg}']/parent::li)[2]").click
    p  "I have clicked on #{arg}"
    p  "I expect to navigate to #{arg} page in account section"
  end

  def self.make_logout_from_account_icon
    visit BASE_URL + "/secure/accountinformation.aspx"
    page.assert_selector(:id, 'ctl00_hl_logout')
    find(:id, 'ctl00_hl_logout').click
    p  "I've clicked Log Out in account icon popup"
  end

  def self.search_icon_click
    page.assert_selector(:xpath, "//button[@aria-label='Search']")
    find(:xpath, "//button[@aria-label='Search']").click
    p  "I've clicked on the search icon in header"
    page.assert_selector(:xpath, "//button/span[text()='Cancel']")
    p  "I am on the search modal"
  end

  def self.cart_icon_click
    page.assert_selector(:xpath, "//button[@aria-label='Cart']")
    find(:xpath, "//button[@aria-label='Cart']").click
    p  "I've clicked on cart icon in header"
    sleep(3)
    page.assert_selector(:xpath, "//h6[.='My Cart']")
  end

  def self.hamburger_icon_click
    find(:xpath, "//button[@aria-label='Menu']").click
    p  "I've clicked on Hamburger icon in header"
    if page.has_selector?(:xpath, "//a[text()='Login']")
    p  "I see Hamburger menu as not logged user"
    elsif
    page.has_selector?(:xpath, "//a[text()='My Account']")
      p  "I see Hamburger menu as logged user"
      end
  end

  def self.logo_click
    find(:xpath, "//img[@title='Annie Selke']").click
    moovweb_logo_true = find_all(:xpath, "//span[text()='brand logo']/parent::a").count
    default_logo_true = find_all(:xpath, "//img[@title='Annie Selke']").count
    if moovweb_logo_true == 1
      find(:xpath, "//span[text()='brand logo']/parent::a").click
    elsif default_logo_true == 1
      find(:xpath, "//img[@title='Annie Selke']").click
    elsif
    p  "I don't see Moovweb or default logo in header"
    end
    p  "After click on logo I was navigated to: #{URI.parse(current_url)}"
  end
end
