# In this module we collecting methods for Header page of VN
require 'capybara/cucumber'


module VN_HeaderPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.click_element(element_name, sleep_after = 0)
    locators = vn_get_header_content['header_locators']
    VN_AllPage.close_hamburger_banner
    find(:xpath, locators[element_name]).click
    sleep sleep_after
    p "I clicked #{element_name}"
  end

  def self.my_account_icon_click
    p  "I am expect account icon"
    page.assert_selector(:xpath, "(//button[@aria-label='Account'])[1]")
    p  'I see account icon in header'
    find(:xpath, "(//button[@aria-label='Account'])[1]").click
    p  "Account icon clicked"
  end

  def self.logo_click
    find(:xpath, "//span[text()='Venus']/parent::a").click
    p  "After click on logo I was navigated to: #{URI.parse(current_url)}"
  end

  def self.navigate_to_category_from_carousel(carousel_element_name)
    carousel_element_text = vn_get_main_carousel_elements(carousel_element_name)
    # find(:xpath, "//a[@data-th='topNavClicked']//span[text()='#{carousel_element_text}']").click
    find(:xpath, %{//a[@data-th="topNavClicked"]//span[text()="#{carousel_element_text}"]}).click
    p "I've clicked #{carousel_element_text}"
    # sleep 10
  end

  def self.hamburger_icon_click
    sleep 2
    find(:xpath, "//button[@aria-label='Menu']").click
    p  "I've clicked on Hamburger icon in header"
  end

  def self.search_icon_click
    page.assert_selector(:xpath, "//button[@aria-label='Search']")
    find(:xpath, "//button[@aria-label='Search']").click
    p  "I've clicked search icon in header"
    page.assert_selector(:xpath, "//div[@id='search-popup--moovweb']")
    p  "I am on search modal via header icon"
  end

  def self.cart_icon_click
    cart_icon_locator = vn_get_header_locators['cart_icon']
    page.assert_selector(:xpath, cart_icon_locator)
    #used because of too slow paypal connection
    set_page_timeout(15)
    begin
      VN_AllPage.close_hamburger_banner
      find(:xpath, cart_icon_locator).click
    rescue Exception
      p "Cart page long loading, stopped loading "
      page.execute_script("window.stop();")
    ensure
      p 'timeout restored'
      set_page_timeout(60)
    end
    p  "I've clicked on cart icon in header"
  end


  def self.expect_content(content_name_to_check)
    locators_to_check_on_page = vn_get_account_options_modal_elements
    element_locator = locators_to_check_on_page[content_name_to_check]
    if content_name_to_check == 'header_account_modal_content'
      VN_HeaderPage.wait_header_account_modal
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, locator)
        p  "I see #{name} element on footer modal page"
      end
    elsif content_name_to_check == 'no_items_in_cart'
      items_count_icon_locator = vn_get_header_content['optional_locators']['cart_icon_items_count']
      page.assert_no_selector(:xpath, items_count_icon_locator, wait: 15)
      p " I don`t see items count icon on header"
    else
      VN_HeaderPage.wait_header_account_modal
      page.assert_selector(:xpath, element_locator)
      p  "I see #{content_name_to_check} element on footer modal page"
    end
  end


  def self.click_element_on_header_account_modal(element_name_to_click)
    footer_elements = vn_get_account_options_modal_elements
    element_locator = footer_elements[element_name_to_click]
    find(:xpath, element_locator).click
    p   "I've clicked #{element_name_to_click}"
  end

  def self.wait_header_account_modal
    if page.has_xpath?("(//*[@id='simple-menu']//ul[@role='menu'])[1]")
      p "Account icon modal is opened. I see modal"
    else
      clicks_count = 0
      loop do
        clicks_count = clicks_count + 1
        sleep 5
        find(:xpath, "(//button[@aria-label='Account'])[1]").click
        break if (page.has_xpath?("(//*[@id='simple-menu']//ul[@role='menu'])[1]") or clicks_count >= 10)
      end
      p "Account icon modal is opened. I see modal" unless clicks_count >= 10
    end
  end

  def self.expect_element_with_value(element_name, expected_value)
    p "Expecting #{element_name} with value #{expected_value}"
    sleep 20
    locators = vn_get_header_locators
    locators = locators.merge(vn_get_header_content['optional_locators'])
    element_locator = locators[element_name]
    p actual_value = find(:xpath, element_locator).text
    expect(actual_value).to eq expected_value
    p "#{element_name} has correct value"
  end

end