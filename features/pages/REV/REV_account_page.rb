# In this module we collecting methods for account page of REVOLVE
require 'capybara/cucumber'


module REV_AccountPage
extend Capybara::DSL
extend RSpec::Matchers

ACCOUNT_PAGE_PREFIX = "revolve:account_page:"

def self.expect_content(content_to_check)
  if content_to_check == 'favorites_landing_page_content'
    expect_favorites_landing_page_content
  elsif content_to_check.include?('remembered')
    expect_remembered_content(content_to_check)
  elsif content_to_check == 'shipping_address_page_content'
    expect_shipping_address_page_content
  else
    raise StandardError.new "No such content"
  end
end

def self.expect_favorites_landing_page_content
  base_locators = rev_get_account_page_content['favorites_landing_page_content']['base_locators']
  base_locators.each do |name, locator|
    page.assert_selector(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + name, locator))
    p "I see #{name}"
  end
  multiple_locators = rev_get_account_page_content['favorites_landing_page_content']['multiple_locators']
  trending_items_locator = multiple_locators['trending_items']
  trending_items_count = find_all(:xpath, trending_items_locator).count
  expect(trending_items_count).to be > 0
  (1..trending_items_count).each do |product_number|
    page.assert_selector(:xpath,
                         "(//div[contains(@class, 'item')])[#{product_number}]//button[contains(@class, 'fav')]")
    page.assert_selector(:xpath,
                         "(//div[contains(@class, 'item')])[#{product_number}]//img[@alt and @src]")
    page.assert_selector(:xpath,
                         "(//div[contains(@class, 'item')])[#{product_number}]//div[contains(@class, 'product-brand')]")
    page.assert_selector(:xpath,
                         "(//div[contains(@class, 'item')])[#{product_number}]//div[contains(., '$') and @class]")
    p "I see #{product_number} product parameters"
  end
  expect_help_us_improve_frame_content
end

def self.click_sign_in_on_wish_list_page
  sign_in_locator = rev_get_account_page_content['favorites_landing_page_content']['base_locators']['sign_in_link']
  find(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + "sign_in_link", sign_in_locator)).click
end

def self.expect_help_us_improve_frame_content
  locators = rev_get_account_page_content['help_us_improve_locators']
  locators.each do |name, value|
    page.assert_selector(:xpath, value) #ta_bug
    p "I see #{name}"
  end
end

def self.clear_wish_list_page
  favorite_items_locator = "(//a[@href='#favorite-button'])"
  wish_list_items_count = find_all(:xpath, favorite_items_locator).count
  p "Wish list items count #{wish_list_items_count}"
  (1..wish_list_items_count).each do |item_number|
    find(:xpath, favorite_items_locator + "[1]").click
    sleep 1.5
    p "Deleted #{item_number} on favorites page"
  end
  p "Wish list is clear"
end

def self.expect_remembered_content(content_name)
  p content_key = content_name.sub('remembered_', '')
  p "remembered content is: #{$revolve_stored_information[content_key]}"
  $revolve_stored_information[content_key].each do |value|
    page.assert_selector(:xpath, %{//*[contains(text(), "#{value}")]})
    p "I see #{value} on favorites page"
  end
end


def self.click_element_favorites_page(element_name)
  if element_name.include? 'item'
    item = parse_item_value(element_name)
    locators = rev_get_account_page_content['favorites_page_content']['favorites_items_multiple_locators']
    ta_locator_name = ACCOUNT_PAGE_PREFIX + "favorites:" + item[:ta_name]
    find(:xpath, m_ta(ta_locator_name, locators[item[:locator_name]] + "[#{item[:number]}]")).click
    p "I clicked #{item[:locator_name]} item: #{item[:number]} on favorites page"
  elsif element_name == 'available_size'
    if page.has_selector?(:xpath, "//*[contains(text(), 'Select Size')]")
      sleep 5
      p click_random_element("(//*[@role='radiogroup' and not(@disabled)])")
    end
  end
end

  def self.expect_shipping_address_page_content
    ta_prefix = ACCOUNT_PAGE_PREFIX + "shipping_address_page:"
    rev_get_account_page_content['shipping_address_page_locators'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(ta_prefix, locator))
      p "I see #{name} on shipping_address_page"
    end
  end

end