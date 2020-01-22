# In this module we collecting methods for SearchModal page of VN
require 'capybara/cucumber'


module VN_SearchModalPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.open_search_modal
    page.assert_selector(:xpath, "//button[@aria-label='Search']")
    find(:xpath, "//button[@aria-label='Search']").click
    p  "I've clicked search icon in header"
    page.assert_selector(:xpath, "//div[@id='search-popup--moovweb']")
    p  "I am on search modal via search modal"
  end

  def self.search_modal_type_term(arg)
    page.assert_selector(:xpath, "//div[@id='search-popup--moovweb']//input")
    if arg == "random"
      random_search_tearm = VN_SEARCHTEARMS[Random.rand(1..VN_SEARCHTEARMS.count)]
      find(:xpath, "//div[@id='search-popup--moovweb']//input").set(random_search_tearm.downcase)
      p  "I've puted #{random_search_tearm} into search input"
      page.assert_selector(:xpath, "//div[@id='search-popup--moovweb']//button[@variant='raised']")
      # find(:xpath, "//div[@id='search-popup--moovweb']//button[@variant='raised']").click
    elsif
    find(:xpath, "//div[@id='search-popup--moovweb']//input").set(arg)
      p  "I've puted #{arg} into search input"
      search_button_locator = vn_get_search_modal_page_locators['search_button']
      page.assert_selector(:xpath, search_button_locator)
    end
  end

  def self.expect_suggested_search
    suggested_search_locator = "//h1[text()='Suggested search']/parent::*"
    page.assert_selector(:xpath, suggested_search_locator)
    result_lines = find_all(:xpath, suggested_search_locator + "//li").count
    p  "I see suggested search with suggestions:"
    (1..result_lines).each do |i|
      p find(:xpath, suggested_search_locator + "//li[#{i}]").text
    end
  end

  def self.random_suggest_click
    suggested_search_locator = "//h1[text()='Suggested search']/parent::*"
    suggest_count = find_all(:xpath, suggested_search_locator + "//li").count
    random_number = Random.rand(1..suggest_count-1)
    search_result_text = find(:xpath, suggested_search_locator + "//li[#{random_number}]").text
    find(:xpath, suggested_search_locator + "//li[#{random_number}]").click
    p "I clicked #{search_result_text}"
  end

  def self.expect_content(content_name_to_check)
    if content_name_to_check == 'search_modal_content'
      locators_to_check_on_page = vn_get_search_modal_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, locator)
        p  "I see #{name} element on search modal page"
      end
      text_to_check_on_page = vn_get_search_modal_page_text
      text_to_check_on_page.each do |(name, text)|
        page.assert_selector(:xpath, "//*[text()='#{text}']")
        p  "I see <#{name}> text element on search modal page"
      end
    end
  end

  def self.click_random_suggested_search
    page.assert_selector(:xpath, "//h2[text()='Suggested search']/parent::*")

    result_lines = find_all(:xpath, "//h2[text()='Suggested search']/parent::*//li").count
    i = Random.rand( 1...result_lines)
    suggested_search_text = find(:xpath, "//h2[text()='Suggested search']/parent::*//li[#{i}]").text

    find(:xpath, "//h2[text()='Suggested search']/parent::*//li[#{i}]").click
    p  "I've clicked on #{suggested_search_text}"
    suggested_search_text = suggested_search_text.upcase.tr("''", "").tr("-"," ")
    sleep 1
    page.assert_selector(:xpath, "//div[text()='All results']")
    page.assert_selector(:xpath, "//div[@style='display: block;']//h1[contains(.,'#{suggested_search_text}')]")
  end

  def self.expect_search_results
    page.assert_selector(:xpath, "//div[text()='All results']")
    search_result_count = find_all(:xpath, "//div[contains(@id, 'item-')]").count
    if search_result_count > 10
      p  "I see more than 10 search results. Here are first 10:"
      for index in 0...10
        p  find(:xpath, "//div[@id='item-#{index}']").text
      end
    elsif
    p  "I see #{search_result_count} results. Here they are:"
      for index in 0...search_result_count
        p  find(:xpath, "//div[@id='item-#{index}']").text
      end
    end
  end

  def self.click_search_btn
    search_field_locator = vn_get_search_modal_page_locators['search_field']
    search_button_locator = vn_get_search_modal_page_locators['search_button']
    page.assert_selector(:xpath, search_field_locator)
    page.assert_selector(:xpath, search_button_locator)
    find(:xpath, search_button_locator).click
    p  "I've clicked on search button in search modal"
    # page.assert_selector(:xpath, "//div[text()='All results']")
  end

  def self.expect_search_modal
    page.assert_selector(:xpath, "//input[@placeholder='Search keyword or item #']")
    page.assert_selector(:xpath, "//span[text()='Cancel']//ancestor::button")
    page.assert_selector(:xpath, "//div[@id='search-popup--moovweb']")
    page.assert_selector(:xpath, "//div[@id='search-popup--moovweb']/div/div/following::button[1]")
    p  "I can see search modal"
  end

  def self.close_search_modal
    find(:xpath, "//span[text()='Cancel']//ancestor::button").click
    page.assert_no_selector(:xpath, "//div[@id='search-popup--moovweb']")
    page.assert_no_selector(:xpath, "//input[@placeholder='Search keyword or item #']")
    p  "I closed search modal"
    end

  def self.expect_search_results_page(content_name_to_check)
    if content_name_to_check == 'search_results_content'
      locators_to_check_on_page = vn_get_search_results_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, locator)
        p  "I see #{name} element on search results page"
      end
    elsif content_name_to_check == 'empty_search_page_content'
      page.assert_text("0 total items")
      p "I see empty search results page"
    end
  end

  def self.click_item_image_on_search_results_page(item_to_click)
    if item_to_click.include? "random"
      page.assert_selector(:xpath, "//div[contains(@id,'item-')]")
      item_count_on_page = find_all(:xpath, "//div[contains(@id,'item-')]").count
      random_item_index = Random.rand(0...item_count_on_page)
      find(:xpath, "//div[@id='item-#{random_item_index}']").click
    end
  end

  def self.check_items_count_on_search_results_page
    $item_count_on_search_results_page = find_all(:xpath, "//div[contains(@id,'item-')]").count
    p  "I see #{$item_count_on_search_results_page} element on search results page"
  end

  def self.select_subcategory_from_filter_on_search_result_page(arg)
    page.assert_selector(:xpath, "//input[@name='subcategories']/preceding-sibling::div")
    find(:xpath, "//input[@name='subcategories']/preceding-sibling::div").click
    page.assert_selector(:xpath, "//ul[@role='listbox']")
    find(:xpath, "//ul[@role='listbox']/li[starts-with(text(),'#{arg} (')]").click
    sleep 2
  end

  def self.check_items_count_with_applied_filter_on_search_results_page
    $item_count_with_filter_on_search_results_page  = find_all(:xpath, "//div[contains(@id,'item-')]").count
    p  "I see #{$item_count_with_filter_on_search_results_page} element on search results page"
  end

  def self.expect_correct_items_count_with_applied_filter_on_search_results_page
    expect($item_count_on_search_results_page).to be >= $item_count_with_filter_on_search_results_page
     p  "With filter applied, items count become from #{$item_count_on_search_results_page} to #{$item_count_with_filter_on_search_results_page} as expected"
  end

end