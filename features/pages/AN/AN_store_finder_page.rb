# In this module we collecting methods for store finder page of ANNIESELKE
require 'capybara/cucumber'


module AN_StoreFinderPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.check_store_finder_page
    expect(page).to have_selector(:xpath, "//div[@data-page='StoreFinder']")
    p  "I am on the Store Finder page"
  end

  def self.sf_search_input(arg)
    location_input = find(:xpath, "//div[@data-page='StoreFinder']//input")
    if arg == "City"
      random_city = AN_STORESEARCH_CITIES[Random.rand(1..AN_STORESEARCH_CITIES.count)]
      location_input.set("").set(random_city)
      p  "I've entered #{random_city} into the input field"
    elsif arg == "State"
      random_state = AN_STORESEARCH_STATES[Random.rand(1..AN_STORESEARCH_STATES.count)]
      location_input.set("").set(random_state)
      p  "I've entered #{random_state} into the input field"
    elsif arg == "ZIP"
      random_zip = AN_STORESEARCH_ZIP[Random.rand(1..AN_STORESEARCH_ZIP.count)].to_s
      location_input.set("").set(random_zip)
      p  "I've entered #{random_zip} into the input field"
    end
  end

  def self.random_store_brand
    find(:xpath, "//select").click
    store_count = find_all(:xpath, "//select/option").count
    random_brand = Random.rand(2..store_count)
    random_brand_selected = find(:xpath, "//select/option[#{random_brand}]")
    random_brand_name = random_brand_selected.text
    random_brand_selected.click
    p  "I've selected the #{random_brand_name} in the brand selector menu"
  end

  def self.submit_store_search
    expect(page).to have_selector(:xpath, "//button/span[text()='Search']")
    find(:xpath, "//button/span[text()='Search']").click
    p  "I've clicked the search button"
  end

  def self.validate_store_search
    if has_selector?(:xpath, "//div[contains(.,'Results Found')]")
      listed_stores = find_all(:xpath, "//h6").count
      p  "#{listed_stores} store search results are displaying. They are listed below:"
      for i in 1..listed_stores
        p  find(:xpath, "(//h6)[#{i}]").text.tr("\n", " ")
      end
      $address_check = find(:xpath, "(//address)[1]").text
      sleep(3)
    elsif has_selector?(:xpath, "//div[contains(.,'No results found')]")
      p  "The query was submitted successfully, but there are no search results to display."
      sleep(3)
    end
  end

  def self.updated_store_search
    if has_selector?(:xpath, "//div[contains(.,'Results Found')]")
      $address_updated_check = find(:xpath, "(//address)[1]").text
      if $address_check == $address_updated_check
        p  "Results are not updated"
      else
        listed_stores = find_all(:xpath, "//h6").count
        p  "#{listed_stores} updated store search results are displaying. They are listed below:"
        for i in 1..listed_stores
          p  find(:xpath, "(//h6)[#{i}]").text.tr("\n", " ")
        end
      end
      sleep(3)
    elsif has_selector?(:xpath, "//div[contains(.,'No results found')]")
      p  "The query was submitted successfully, but there are no search results to display."
      sleep(3)
    end
  end
end
