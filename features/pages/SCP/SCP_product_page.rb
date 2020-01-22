require 'capybara/cucumber'

module SCP_ProductPage
extend Capybara::DSL
extend RSpec::Matchers

PRODUCT_PAGE_PREFIX = "shoecarnival:product_page:"

  def self.go_to_pdp(item_id)
    link = scp_get_test_items[item_id]['pdp_link']
    visit BASE_URL + link
  end

  def self.expect_content(content_name)
    if content_name == 'product_page_content'
      expect_product_page_content
    end
  end

  def self.expect_product_page_content
    scroll_page(1)
    scp_get_product_page_content['base_locators'].each do |name, locator|
      ta_locator = PRODUCT_PAGE_PREFIX + name
      page.assert_selector(:xpath, m_ta(ta_locator, locator))
      p "I see #{name} on product_page"
    end
    scp_get_product_page_content['multiple_locators'].each do |name, locator|
      elements_count = find_all(:xpath, locator).count
      expect(elements_count).to be > 0
      p "I see #{name} count: #{elements_count}"
    end
  end

  def self.expect_reviews_content
    reviews_content = scp_get_product_page_content['reviews_content']
    ta_locator_prefix = PRODUCT_PAGE_PREFIX + "reviews:"
    reviews_content['locators'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(ta_locator_prefix + name, locator))
      p "I see #{name} on reviews section"
    end
    reviews_content['multiple_locators'].each do |name, locator|
      elements_count = find_all(:xpath, locator).count
      expect(elements_count).to eq 5
      p "#{name} has 5 stars"
    end
    reviews_content['text_values'].each do |name, text|
      page.assert_text(text)
      p "I see #{text} on reviews"
    end
    reviews_content['pros_and_cons_multiple_locators'].each do |name, multiple_locator|
      p elements_count = find_all(:xpath, multiple_locator).count
      expect(elements_count).to be > 1
      p "I see #{name} total elements"
    end
  end

  def self.click_element(element_name)
    if element_name == 'available_size_button'
      click_random_element(scp_get_product_page_content['multiple_locators']['available_size_buttons'])
    else
      locators = scp_get_product_page_content['base_locators']
      begin
        find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + element_name, locators[element_name])).click
      rescue Exception
        p "Couldn't click #{element_name} trying to close ads"
        find(:xpath, scp_get_all_page_content['adv_banners_locators']['feedback_banner']).click
        find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + element_name, locators[element_name])).click
      end
      p "I clicked #{element_name}"
    end
  end

end
