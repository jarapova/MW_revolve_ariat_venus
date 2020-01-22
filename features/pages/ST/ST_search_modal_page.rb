# In this module we collecting methods for search modal page of ST
require 'capybara/cucumber'

module ST_SearchModalPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.open_search_modal
    page.assert_selector(:xpath, "//button[@aria-label='Search']") # assert search btn in header
    find(:xpath, "//button[@aria-label='Search']").click # click search btn in header
    p  "I've clicked search icon in header"
    page.assert_selector(:xpath, "//input[@placeholder='Search...']/ancestor::form") # assert search form in search page#
    p  "I am on search modal"
  end

  def self.expect_search_results
    page.assert_selector(:xpath, "//span[contains(.,'Stage')]//span[contains(., 'search :')]") # assert search result page
     ST_SearchModalPage.get_search_results
  end

  def self.click_search_btn
    page.assert_selector(:xpath, "(//input[@placeholder='Search...']/ancestor::form//button)[3]") # assert search btn
    find(:xpath, "(//input[@placeholder='Search...']/ancestor::form//button)[3]").click # click search tbn
    p  "I've clicked on search button in search modal"
    page.assert_selector(:xpath, "//span[contains(.,'Stage')]//span[contains(., 'search :')]") # assert search result page
  end

  def self.search_modal_type_term(arg)
    page.assert_selector(:xpath, "//input[@placeholder='Search...']") # assert search field
    if arg == "random"
      ST_SearchModalPage.input_random_search_term #st search helper
    elsif
      ST_SearchModalPage.input_search_term(arg) #st search helper
    end
  end

  def self.get_search_results
    search_result_count = find_all(:xpath, "//div[@id]//*[contains(.,'$')]/ancestor::li").count

    if search_result_count > 30
      p  'I see more than 10 search results. Here are first 10:'
      (1...10).each {|index|
        p  find(:xpath, "(//div[@id]//*[contains(.,'$')]/ancestor::li)[#{index}]").text
      }
    elsif
    p  "I see #{search_result_count} results_user_1. Here they are:"
      (1...search_result_count).each {|index|
        p  find(:xpath, "(//div[@id]//*[contains(.,'$')]/ancestor::li)[#{index}]").text
      }
    end
  end

  def self.input_search_term (search_term)
    find(:xpath, "//input[@placeholder='Search...']").set(search_term) #set search field
    p  "I've puted #{search_term} into search input"
    suggestions= find_all(:xpath, "//input[@placeholder='Search...']/ancestor::form/..//ul").count
    if suggestions >1
      page.assert_selector(:xpath, "//input[@placeholder='Search...']/ancestor::form/..//ul") #assert suggestions
      (1...suggestions).each do |index|
        text_suggestions = find(:xpath, "(//input[@placeholder='Search...']/ancestor::form/..//ul/li[#{index}])").text
        p  "There is suggestion for '#{text_suggestions}'"
      end
    elsif
      p  "No suggestions for this search tearm"
    end
  end

  def self.input_random_search_term
    search_tearm = ST_SEARCHTEARMS[Random.rand(1..ST_SEARCHTEARMS.count)]
    find(:xpath, "//input[@placeholder='Search...']").set(search_tearm.downcase) #set search field
    p  "I've puted #{search_tearm} into search input"
    suggestions= find_all(:xpath, "//input[@placeholder='Search...']/ancestor::form/..//ul").count
    if suggestions >1
      page.assert_selector(:xpath, "//input[@placeholder='Search...']/ancestor::form/..//ul") #assert suggestions
      (1...suggestions).each do |index|
        text_suggestions = find(:xpath, "(//input[@placeholder='Search...']/ancestor::form/..//ul/li[#{index}])").text
        p  "There is suggestion for '#{text_suggestions}'"
      end
    elsif
    p  "No suggestions for this search tearm"
    end
  end

end
