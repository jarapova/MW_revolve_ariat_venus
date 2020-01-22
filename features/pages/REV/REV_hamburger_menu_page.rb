# In this module we collecting methods for Hamburger menu page of REVOLVE
require 'capybara/cucumber'


module REV_HamburgerMenuPage
  extend Capybara::DSL
  extend RSpec::Matchers

  HAMBURGER_PREFIX = "revolve:hamburger_menu:"

  def self.click_hamburger_element(element_name)
    if element_name == "sign_in_button"
      sign_in_button_locator = rev_get_hamburger_content['hamburger_locators']['sign_in_button']
      page.assert_selector(:xpath, sign_in_button_locator) #ta_bug
      find(:xpath, sign_in_button_locator).click
    elsif element_name.include? 'back_button'
      back_button_number = element_name.sub('_back_button', "").to_i
      find(:xpath, m_ta(HAMBURGER_PREFIX + element_name,
                        "(//ul/*[@role='button'])[#{back_button_number}]")).click
    else
      find(:xpath, "//ul//div[contains(@role, 'button') and contains(., '#{element_name}')]").click #ta_bug Womens -> Shoes and then Mens -> Shoes
      sleep 0.5
    end
    p "I clicked #{element_name} on hamburger_menu"
  end

  def self.expect_content(content_name)
    if content_name.include? 'hamburger_guest_first_page_content'
      expect_guest_first_page_content
    elsif content_name == 'hamburger_logged_in_first_page_content'
      expect_logged_in_first_page_content
    elsif content_name.include? 'second_subcategory'
      page.assert_selector(:xpath, "//ul[4]/li")
      menu_elements_count = find_all(:xpath, "//ul[4]/a/li").count
      expect(menu_elements_count).to be >= 1
    end
  end

  def self.expect_logged_in_first_page_content
    check_hamburger_categories
    category_name = rev_get_hamburger_content['optional_categories']['my_revolve']
    ta_category_locator = HAMBURGER_PREFIX + 'my_revolve'
    category_locator = "(//div[@role='document']//ul)[1]//*[contains(text(), '#{category_name}')]"
    page.assert_selector(:xpath, m_ta(ta_category_locator, category_locator))
    page.assert_text(/Hey, [A-Za-z0-9]+/)
    p "I see My Revolve category"
  end

  def self.check_hamburger_categories
    rev_get_hamburger_content['guest_first_page_content'].each do |name, text|
      page.assert_selector(:xpath, m_ta(HAMBURGER_PREFIX + name,
                                        "(//div[@role='document']//ul)[1]//*[contains(text(), '#{text}')]"))
      p "I see #{name} on hamburger first page"
    end
  end

  def self.expect_guest_first_page_content
    check_hamburger_categories
    sign_in_button_locator = rev_get_hamburger_content['hamburger_locators']['sign_in_button']
    page.assert_selector(:xpath, m_ta(HAMBURGER_PREFIX + "sign_in_button", sign_in_button_locator))
    p "I see sign_in_button on hamburger first page"
  end

  def self.check_header_with_value(element_name, expected_value)
    actual_text = ""
    if element_name == 'first_page_header'
      actual_text = find(:xpath, m_ta(HAMBURGER_PREFIX + element_name,
                                      "//ul//div[contains(text(), 'Hey,')]")).text
    elsif element_name == 'category_header'
      actual_text = find(:xpath, m_ta(HAMBURGER_PREFIX + element_name,
                                      "//ul[3]/li//div[text()]")).text
    elsif element_name == 'subcategory_header'
      actual_text = find(:xpath, m_ta(HAMBURGER_PREFIX + element_name,
                                      "//ul[4]/li//div[text()]")).text
    end
    p "hamburger text #{actual_text} and expected text #{expected_value}(comparing downcase strings)"
    expect(actual_text.downcase).to eql(expected_value.downcase)
  end
end