# In this module we collecting methods for category page of ST
require 'capybara/cucumber'


module ST_CategoryPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.visit_plp
    visit "https://www.stage.com/b/women-clothing-dresses/N-as1dva/"
    p "I am on plp"
    update_page
  end

  def self.expect_subcategory_page_for(arg)
    page.assert_selector(:xpath, "//h1[text()='#{arg}']")
    page.assert_selector(:xpath, "//button[contains(.,'Filter')]")
    p  "I appear on subcategory #{arg} page"
    p  "And I see items:"
    ST_SearchModalPage.get_search_results
  end

  def self.expect_content(content_name)
    if content_name == "plp_content_plus_api_test"
      expect_product_list_page_content
    end
  end

  def self.expect_product_list_page_content
    ST_AllPage.close_all_banners
    if page.has_selector?(:xpath, "//a[@data-moov-link and *[text()='brand logo']]")
      p "Expecting product list page content"
      sleep 5
      VN_AllPage.update_page
      item_images_locator = "(//ul//li//img[@src])"
      p items_count = find_all(:xpath, item_images_locator).count
      expect(items_count).to be > 0
      random_number = Random.rand(1..items_count)
      sleep 3
      find(:xpath, item_images_locator + "[#{random_number}]").click
      p "Clicked on #{random_number} product"
      sleep 15
      $api_entries_log['pdp_entries'] = get_current_network_entries
      p page.current_url
      page.visit(page.current_url + ".json")
      p json_string = find(:xpath, "//*[text()]").text
      json = JSON.parse(json_string)
      st_get_json_paths.each do |name, path|
        expect(check_json_field_type(path, json)).to be true
        p "#{name} is correct"
      end
      p 'Checking adobe data layer'
      st_get_json_adobe_data_layer.each do |name, path|
        expect(check_json_field_type(path, json))
        p "I see #{name} on adobe data layer"
      end
      $api_entries_log['api_json_request_entries'] = get_current_network_entries
    else
      p "Page is not PWA"
      $api_entries_log['Error'] = '{"Error": "Not PWA page"}'
    end
  end
end