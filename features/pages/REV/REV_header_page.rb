# In this module we collecting methods for Header page of REVOLVE
require 'capybara/cucumber'


module REV_HeaderPage
  extend Capybara::DSL
  extend RSpec::Matchers

  HEADER_PREFIX = "revolve:header:"
  def self.click_element(element_name)
    elements = rev_get_header_elements
    elements = elements.merge(rev_get_header_content['navigation_bar'])
    p HEADER_PREFIX + element_name
    find(:xpath, m_ta(HEADER_PREFIX + element_name, elements[element_name])).click
    sleep 1.5# if element_name == 'hamburger_button'
    p "I've clicked #{element_name} on header"
  end

  def self.expect_element_with_value(element_name, expected_value)
    p "Expecting #{element_name}..."
    sleep 12
    if element_name == 'cart_icon_items_count'
      locator = rev_get_header_content['header_elements']['cart_icon']
      ta_locator = HEADER_PREFIX + "cart_icon"
    elsif element_name == 'favorites_icon_items_count'
      locator = rev_get_header_content['header_elements']['favorites_button']
      ta_locator = HEADER_PREFIX + "favorites_button"
    end
    p actual_value = find(:xpath, m_ta(ta_locator, locator)).text
      expect(actual_value).to eql expected_value
      p "#{element_name} are equal expected value"
  end

  def self.expect_content(content_name)
    if content_name == 'navigation_bar_content'
      expect_navigation_bar_content
    elsif content_name == 'dropdown_menu_content'
      expect_navigation_dropdown_menu
    elsif content_name == 'revolve_man_logo'
      mens_logo_locator = "//span[text()='Revolve, Apparel & Fashion' or text()='Forward by elyse walker1']/parent::a//span[text()='MAN']"
      page.assert_selector(:xpath, m_ta(HEADER_PREFIX + "mens_logo", mens_logo_locator))
      p "Logo is Revolve Man"
    end
  end

  def self.expect_navigation_bar_content
    nav_bar_locators = rev_get_header_content['navigation_bar']
    nav_bar_locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(HEADER_PREFIX + name, locator))
      p "I see #{name} on navigation bar on header"
    end
  end

  def self.expect_navigation_dropdown_menu
    sleep 1
    categories_count = find_all(:xpath, get_dropdown_category).count
    expect(categories_count).to be > 9
    categories = rev_get_header_content['categories_text']
    categories.each do |name, text|
      page.assert_selector(:xpath, m_ta(HEADER_PREFIX + "header_nav:" + name,
                                        get_dropdown_category(text)))
      p "I see #{name} category"
    end
    page.assert_selector(:xpath, m_ta(HEADER_PREFIX + "header_nav:" + "Most_Wanted",
                                      "(//div[@role='document'])[last()]//*[text()='Most Wanted']"))
    page.assert_selector(:xpath, m_ta(HEADER_PREFIX + "header_nav:" + "Featured_Shops",
                                      "(//div[@role='document'])[last()]//*[text()='Featured Shops']"))
  end

  def self.get_dropdown_category(category_name = '')
    if category_name == ''
      return "(//div[@role='document'])[last()]//a[text()]"
    else
      return "(//div[@role='document'])[last()]//a[text()='#{category_name}']"
    end
  end

  def self.click_category_dropdown(category_name)
    category_locator = get_dropdown_category(category_name)
    page.assert_selector(:xpath,
                         m_ta(HEADER_PREFIX + "nav:" + category_name.gsub(" & ", ""), category_locator))
    find(:xpath, m_ta(HEADER_PREFIX + "nav:" + category_name.gsub(" & ", ""), category_locator)).click
  end


end