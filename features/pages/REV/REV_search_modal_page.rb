# In this module we collecting methods for Search modal page of REVOLVE
require 'capybara/cucumber'


module REV_SearchModalPage
  extend Capybara::DSL
  extend RSpec::Matchers

  SEARCH_MODAL_PREFIX = "revolve:search_modal:"

  def self.expect_content(content_name)
    if content_name == 'search_modal_content'
      expect_search_modal_content
    elsif content_name == 'suggested_search_results_content'
      expect_suggested_search
    end
  end

  def self.expect_search_modal_content
    rev_get_header_content['base_search_modal_locators'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(SEARCH_MODAL_PREFIX + name, locator))
      p "I see #{name} on search modal"
    end
  end

  def self.expect_suggested_search
    rev_get_header_content['suggested_search_locators'].each do |name, locator|
      page.assert_selector(:xpath, locator) #m_ta(SEARCH_MODAL_PREFIX + name, locator)) #ta_bug
      p "I see #{name} on search modal with search results"
    end
    suggested_search_texts_locator = rev_get_header_content['multiple_search_locators']['suggested_search_items_texts']
    suggested_search_count = find_all(:xpath, suggested_search_texts_locator).count
    expect(suggested_search_count).to be > 0
    (1..suggested_search_count).each do |search_number|
      page.assert_selector(:xpath, suggested_search_texts_locator + "[#{search_number}]")
      p find(:xpath, suggested_search_texts_locator + "[#{search_number}]").text
    end
  end

  def self.close_search_modal
    sleep 1
    close_button_locator = rev_get_header_content['base_search_modal_locators']['close_button']
    find(:xpath, m_ta(SEARCH_MODAL_PREFIX + "close_button", close_button_locator)).click
    search_locator = rev_get_header_content['base_search_modal_locators']['search_field']
    page.assert_no_selector(:xpath, search_locator)
    p "I closed search modal"
  end

  def self.search_modal_type_term(input_text)
    search_locator = rev_get_header_content['base_search_modal_locators']['search_field']
    find(:xpath, m_ta(SEARCH_MODAL_PREFIX + "search_field", search_locator)).set(input_text)
    sleep 5
  end

  def self.click_suggested_search(suggested_search_name)
    if suggested_search_name == 'random_suggested_search'
      suggested_search_locator = rev_get_header_content['multiple_search_locators']['suggested_search_items']
      suggested_search_count = find_all(:xpath, suggested_search_locator).count
      random_number = Random.rand(1..suggested_search_count)
      find(:xpath, suggested_search_locator + "[#{random_number}]").click
      p "I clicked on random suggested search"
    elsif suggested_search_name == 'clear_button'
      sleep 1
      clear_button_locator = rev_get_header_content['suggested_search_locators']['clear_text_button']
      page.assert_selector(:xpath, m_ta(SEARCH_MODAL_PREFIX + "clear_text_button", clear_button_locator))
      find(:xpath, clear_button_locator).click
    end
  end

  def self.click_search_btn
    find_button_locator = rev_get_header_content['suggested_search_locators']['find_button']
    find(:xpath, m_ta(SEARCH_MODAL_PREFIX + "find_button", find_button_locator)).click
    p "I clicked find_button"
  end

end