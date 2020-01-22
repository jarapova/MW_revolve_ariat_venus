# In this module we collecting methods for Privacy Policy page of VN
require 'capybara/cucumber'

module VN_ProductLandingPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.get_all_locators
    elements_locators = vn_get_product_page['product_landing_page']['optional_locators']
    elements_locators = elements_locators.merge(vn_get_product_page['product_landing_page']['specific_locators'])
  end

  def self.expect_content(content_name)
    scroll_page
    if content_name == 'product_landing_content'
      expect_product_landing_content
    elsif content_name == 'product_list'
      VN_ProductListingPage.check_product_list_page_content
    elsif content_name == 'random_item_name'
      VN_ProductListingPage.click_element(content_name)
    else
      page.assert_selector(:xpath, get_all_locators[content_name])
      p "I see #{content_name}"
    end
  end

  def self.expect_product_landing_content
    locators = {}
    locators['review_snippet'] = vn_get_product_page['base_pdp_locators']['review_snippet']
    locators['add_to_bag_button'] = vn_get_product_page['base_pdp_locators']['add_to_bag_button']
    locators = locators.merge(vn_get_product_page['product_landing_page']['specific_locators'])
    locators.each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name} on product_landing_page"
    end
  end

  def self.click_item_color(color_name, sleep_after = 5)
    color_locator = "//*[@data-page='ProductLanding']//img[contains(@alt, '#{color_name.sub('_', ' ').upcase}')]"
    find(:xpath, color_locator).click
    sleep sleep_after
    p "I clicked color #{color_name}"
  end

  def self.click_element(element_name)
    if element_name == "available_size_button"
      sizes_locator = vn_get_product_page['product_landing_page']['multiple_locators']['available_size_locator']
      p "I clicked " + click_random_element(sizes_locator).to_s
    elsif element_name.include? "color_button"
      click_item_color(element_name.sub('color_button_', ''), 10)
    elsif element_name.include?'inseam_size_button'
      click_inseam_size_button(element_name.sub('inseam_size_button_',''))
    else
      find(:xpath, get_all_locators[element_name]).click
      p "I clicked #{element_name} on product_landing_page"
    end
  end

  def self.expect_element_with_value(element_name, expected_value)
    element_locator = vn_get_product_page['product_landing_page']['specific_locators'][element_name]
    p actual_value = find(:xpath, element_locator).text
    if element_name == 'color_text'
      actual_value.sub!('Color: ', '')
    end
    p "AR: #{actual_value} ER: #{expected_value}"
    expect(actual_value).to eq expected_value
    p "Results are equal"
  end

  def self.click_inseam_size_button(inseam_size, sleep_after = 5)
    find(:xpath, "//*[contains(text(), '#{inseam_size.upcase}') and parent::button]").click
    sleep sleep_after
    p "I clicked #{inseam_size}"
  end

  def self.switch_url_to_landing_page
    current_url = page.current_url
    landing_url = current_url.sub('viewproduct', 'productlanding')
    page.visit(landing_url)
  end

end