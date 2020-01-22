require 'capybara/cucumber'


module SCP_ProductListPage
  extend Capybara::DSL
  extend RSpec::Matchers

  PRODUCT_LIST_PAGE_PREFIX = "shoecarnival:product_list_page:"

  def self.expect_content(content_name)
    VN_AllPage.update_page
    if content_name == 'product_list_page_content'
      expect_product_list_page_content
    elsif content_name == 'empty_search_result_page'
      expect_empty_search_result_page
    end
  end

  def self.expect_product_list_page_content
    base_locators = scp_get_product_list_page_content['base_locators']
    base_locators.each do |name, locator|
      ta_locator = PRODUCT_LIST_PAGE_PREFIX + name
      page.assert_selector(:xpath, m_ta(ta_locator, locator))
      p "I see #{name} on PLP"
    end
    expect_items_content
  end

  def self.expect_empty_search_result_page
    scroll_page
    content = scp_get_product_list_page_content['empty_search_page_content']
    content['text'].each do |name, text|
      page.assert_text(text)
      p "I see #{text}"
    end
    ta_prefix = PRODUCT_LIST_PAGE_PREFIX + "empty_cart:"
    content['locators'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(ta_prefix + name, locator))
      p "I see #{name} on empty_search_result"
    end
    content['refine_search_text'].each do |name, text|
      page.assert_selector(:xpath, %{//a[contains(text(), '#{text}')]})
      p "I see #{name} refine link"
    end
  end

  def self.expect_items_content
    items_locators = scp_get_product_list_page_content['multiple_locators']['items_multiple_locators']
    (1..get_items_count_on_page).each do |item_number|
      items_locators.each do |name, multiple_locator|
        item_element_locator = multiple_locator + "[#{item_number}]"
        ta_locator = PRODUCT_LIST_PAGE_PREFIX + name + "_" + item_number.to_s
        page.assert_selector(:xpath, item_element_locator) #ta_bug
        p "I see #{name} of #{item_number} item on product_list_page"
      end
    end
  end

  def self.get_items_count_on_page
    VN_AllPage.update_page
    all_items_locator = scp_get_product_list_page_content['multiple_locators']['all_items_locator']
    p items_count = find_all(:xpath, all_items_locator).count
    expect(items_count).to be > 0
    items_count
  end

  def self.click_element(element_name)
    if element_name == 'random_item_name'
      items_count = get_items_count_on_page
      number = click_random_element(scp_get_product_list_page_content['multiple_locators']['all_items_locator'])
      p "I clicked #{number} element"
    end
  end
end
