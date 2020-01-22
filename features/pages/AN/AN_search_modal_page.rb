# In this module we collect methods for the search page of ANNIE SELKE
require 'capybara/cucumber'

module AN_SearchModalPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.open_search_modal
    page.assert_selector(:xpath, "//button[@aria-label='Search']")
    find(:xpath, "//button[@aria-label='Search']").click
    p  "I've clicked on the search icon in header"
    sleep(2)
    page.assert_selector(:xpath, "//button/span[text()='Cancel']")
    p  "I am on the search modal"
  end

  def self.search_modal_type_term(arg)
    page.assert_selector(:xpath, "//form//div/input[@type='text']")
    if arg == "random"
      AN_SearchModalPage.input_random_search_term
    elsif
    AN_SearchModalPage.input_search_term(arg)
    end
  end

  def self.input_random_search_term
    search_term = AN_SEARCHTERMS[Random.rand(1..AN_SEARCHTERMS.count)]
    find(:xpath, "//form/div/div/div/input").set(search_term.downcase)
    p  "I've entered #{search_term} into the search input"
    page.assert_selector(:xpath, "//h2[text()='Suggested search']")
  end

  def self.expect_suggested_search
    page.assert_selector(:xpath, "//h2[text()='Suggested search']/parent::*")
    p  result_lines = find_all(:xpath, "//h2[text()='Suggested search']/parent::*//li/a/span").count
    result_lines = result_lines + 1
    p  "I see suggested search with suggestions:"
    for i in 1...result_lines
      p  suggested_search_text = find(:xpath, "(//h2[text()='Suggested search']/parent::*//li/a/span)[#{i}]").text
    end
  end

  def self.click_random_suggested_search
    page.assert_selector(:xpath, "//h2[text()='Suggested search']/parent::*")

    result_lines = find_all(:xpath, "//h2[text()='Suggested search']/parent::*//li/a/span").count
    result_lines = result_lines + 1
    i = Random.rand( 1...result_lines)
    suggested_search_text = find(:xpath, "(//h2[text()='Suggested search']/parent::*//li/a/span)[#{i}]").text

    find(:xpath, "(//h2[text()='Suggested search']/parent::*//li/a/span)[#{i}]").click
    p  "I've clicked on #{suggested_search_text}"
    sleep 1
    page.assert_selector(:xpath, "//span[contains(.,'total items')]")
    page.assert_selector(:xpath, "//span[contains(.,'#{suggested_search_text}')]")

  end

  def self.expect_search_results
    page.assert_selector(:xpath, "//span[contains(.,'total items')]")
    p  "I am on the search results page"
    an_get_search_results
  end

  def self.click_search_btn
    page.assert_selector(:xpath, "//button[@aria-label='Search']")
    find(:xpath, "//button[@type='submit']").click
    p  "I've clicked on search button in search modal"
    sleep 1
  end

  def self.invalid_search_request
    page.assert_selector(:xpath, "//form//div/input[@type='text']")
    invalid_search_term = "Invalid"
    find(:xpath, "//form/div/div/div/input").set(invalid_search_term)
    p  "I've entered #{invalid_search_term} into the search input"
    page.assert_selector(:xpath, "//h2[text()='Suggested search']")
  end

  def self.input_search_term(search_term)
    find(:xpath, "//input").set(search_term) #set search field
    p  "I've puted #{search_term} into search input"
  end

  def self.expect_user_is_on_no_results_page
    page.assert_selector(:xpath, "//div[@data-page='Subcategory']//h6")
    p  "I appear to be on the No Results page"
    p  find(:xpath, "//div[@data-page='Subcategory']//h6").text
  end

  def self.an_get_search_results
    search_result_count = find(:xpath, "//span[contains(., 'total items')]").text.delete!('total items').to_i
    if search_result_count > 10
      p  "I see more than 10 search results. Here are first 10:"
      for index in 1...10
        p  find(:xpath, "//li[#{index}]//a/div[2]").text
      end
    elsif
    p  "I see #{search_result_count} results. Here they are:"
      for index in 1...search_result_count
        p  find(:xpath, "//li[#{index}]//a/div[2]").text
      end
    end
  end

end
