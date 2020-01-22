# In this module we collecting methods for subcategory or PLP page of VN
require 'capybara/cucumber'


module VN_ProductListingPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.click_element(item_to_click)
    if item_to_click.include? "random"
      all_items_locator = vn_get_product_list_page_content['multiple_items_locators']['all_items']
      page.assert_selector(:xpath, all_items_locator)
      item_count_on_page = find_all(:xpath, "//div[contains(@id,'item-')]").count
      random_item_number = Random.rand(1..item_count_on_page)
      find(:xpath, all_items_locator + "[#{random_item_number}]").click
    else
      locators = vn_get_product_list_page_content['optional_locators']
      if locators[item_to_click]
        find(:xpath, locators[item_to_click]).click
        p "I clicked #{item_to_click} on subcategory_page"
      else
        raise StandardError.new "No such content or locator"
      end
    end
  end

  def self.click_subcategory_from_filter(subcategory_name)
    if subcategory_name == "random_subcategory"
      page.assert_selector(:xpath, "//ul[@role='listbox']")
      subcategories_count = find_all(:xpath, "//ul[@role='listbox']/li").count
      subcategories_count = subcategories_count-2 #removing SALE and CLEARANCE as it is not subcategories
      p  "I see #{subcategories_count} subcategories in filter"
      random_subcategory_index = Random.rand(1...subcategories_count)
      subcategory_name = find(:xpath, "//ul[@role='listbox']/li[#{random_subcategory_index}]").text
      find(:xpath, "//ul[@role='listbox']/li[#{random_subcategory_index}]").click
      p"I've clicked #{subcategory_name} item from subcategory navigation filter"
    else
      page.assert_selector(:xpath, "//ul[@role='listbox']")
      find(:xpath, "//ul[@role='listbox']/li[text()='#{subcategory_name}']").click
    end
    end

  def self.click_subcategory_filter
    filter_locator = vn_get_product_list_page_content['base_locators']['subcategory_filter']
    filter_pop_up_locator = "//div[@id='menu-subcategories']//ul[@role='listbox']"
    page.assert_selector(:xpath, filter_locator)
    find(:xpath, filter_locator).click
    page.assert_selector(:xpath, filter_pop_up_locator)
    p  "I clicked filter_locator and  see filter pop up on subcategory page"
  end

  def self.click_parameters_filter
    parameters_filter_locator = "(//div[@data-page='Subcategory']//span[text()='Filter'])//ancestor::button"
    parameters_filter_pop_up_locator = "//div[@role='document']//div[text()='Filter']/following::button[@style='display: none;']"
    page.assert_selector(:xpath, parameters_filter_locator)
    find(:xpath, parameters_filter_locator).click
    page.assert_no_selector(:xpath, parameters_filter_pop_up_locator)
    p  "I clicked filter_locator and  see filter pop up on subcategory page"
  end

  def self.check_product_list_page_content
    p "Expecting plp content"
    VN_AllPage.scroll_to_bottom
    items_multiple_locators = vn_get_product_list_page_content['multiple_items_locators']
    items_count = find_all(:xpath, "(//div[contains(@id,'item-')])").count
    expect(items_count).to be >= 1
    (1..items_count).each do |item_number|
      items_multiple_locators.each do |name, locator|
        page.assert_selector(:xpath, locator + "[#{item_number}]")
        p "I see #{name} on item #{item_number}"
      end
    end
    VN_AllPage.scroll_to_top
  end

  def self.expect_content(content_name_to_check)
    if content_name_to_check.include? "_subcategory_filter_content"
      # This is checking that subcategory fillter contains elements from YAML file
      category_name = content_name_to_check.gsub("_subcategory_filter_content", "")
      subcategories_array = vn_get_subcategories(category_name)
      subcategories_array.each do |(item_name, item_text)|
        subcategory_element_locator = "//div[@id='menu-subcategories']//ul[@role='listbox']/li[text()='#{item_text.capitalize}']"
        page.assert_selector(:xpath, subcategory_element_locator)
        p  "I clicked filter and  see #{item_name} in filter pop up on subcategory page"
        p "I see subcategory filter and  see #{item_name} in filter pop up on subcategory page"
      end
    elsif content_name_to_check == 'subcategory_filter_content'
      categories_count = find_all(:xpath, "//ul[@role='listbox']/li").count
      expect(categories_count).to be > 10
      p "I see #{categories_count} categories"
    elsif content_name_to_check == 'product_list_page_content'
      VN_AllPage.update_page
      check_product_list_page_content
    elsif content_name_to_check == 'correct_price'
      expect_correct_plp_items_count
    elsif content_name_to_check == 'different_plp_items'
      old_items = $venus_stored_information['plp_items']
      old_items_count = old_items.count
      extended_items = get_items_names
      extended_items_count = extended_items.count
      new_items = extended_items[old_items_count..extended_items_count-1]
      p "Old items: #{old_items}"
      p "New items: #{new_items}"
      expect(old_items).not_to match_array(new_items)
      p "Items are different on PLP"
    elsif content_name_to_check.include? "_item_parameters_filter_content"
      #This is checking that item parammeters filter contains expected content from YAML
      #It's checking size, color other
        category_name = content_name_to_check.gsub("_item_parameters_filter_content", "")
        subcategories_array = vn_get_item_parameters_filter_options(category_name)
        subcategories_array.each do |(item_parameter_name, item_parameter_text)|
          if item_parameter_name.include? 'by_'
            parameter_section_locator = "//div[@aria-expanded='true']//h6[text()='#{item_parameter_text}']"
            page.assert_selector(:xpath, parameter_section_locator)
            p  "I see #{item_parameter_name} filter section in filter pop up on subcategory page"
            p "I see #{item_parameter_name} filter section in filter pop up on subcategory page"
          else
            parameter_locator = "//div[@aria-expanded='true']/ancestor::div//span[text()='#{item_parameter_text}']"
            page.assert_selector(:xpath, parameter_locator)
            p  "I see #{item_parameter_name} filter section in filter pop up on subcategory page"
            p"I see #{item_parameter_name} filter section in filter pop up on subcategory page"
          end
        end
    elsif content_name_to_check.include? "_items_content"
      #This is checking that PLP have number of items
      # has number of view details ant other text from YAML
      # and its checking that total items number is correct
      VN_AllPage.update_page
      subcategory_name = content_name_to_check.gsub("_items_content", "")
      items_content_array = vn_get_subcategory_items_content(subcategory_name)
      items_content_array.each do |(content_name,content_value)|
        if content_name == "view_details"
          items_element_locator = "(//div[contains(@id,'item-')]/a/div/div[p]/*[contains(., '#{content_value}')])"
          page.assert_selector(:xpath, items_element_locator)
          elements_count = find_all(:xpath, items_element_locator).count
          all_items_locator = "(//div[contains(@id, 'item')])"
          items_count = find_all(:xpath, all_items_locator).count
          expect(elements_count).to eq items_count
          p "All items has #{content_name}"
        elsif content_name.include? "item_name_contain"
          VN_AllPage.update_page
          #This is checking that items on PLP have expected word in theirs names
          # Like there are dresses item names on Dresses PLP
          p "content to check: #{content_value}"
          values_count = find_all(:xpath, "//div[contains(@id,'item-')]/a//div[contains(., '#{content_value}')]").count
          expect(values_count).to be > 1
          p  "I see  #{values_count} #{content_name} elements with value #{content_value} on subcategory page"
          p "I see  #{values_count} #{content_name} elements with value #{content_value} on subcategory page"
        end
      end
    elsif content_name_to_check == 'extended_product_list_page_content'
      expect_extended_product_list_page_content
    else
      raise StandardError.new "No such content or locator"
    end
  end


  def self.open_parameters_filter_dropdowns
    click_all_elements("(//*[@role='document']//*[@aria-expanded='false'])", 0.3)
  end

  def self.close_parameters_filter
    parameters_filter_pop_up_locator = "//div[@role='document']//div[text()='Filter']/following::button[@style='display: none;']"
    find(:xpath, "//div[@role='document']//div[text()='Filter']/following::button").click
    page.assert_selector(:xpath, parameters_filter_pop_up_locator, visible: false)
    p  "I closed filter_locator and don't see filter pop up on subcategory page"
  end

  def self.check_price_with_sale_subcategory_page
    items = find_all(:xpath, "//div[contains(@id,'item-')]").count
    (1..items).each do |item|
      price_with_sale = find(:xpath,"(//div[contains(@id,'item-')])[#{item}]//p/span/span[2]").text
      default_price = find(:xpath,"(//div[contains(@id,'item-')])[#{item}]//p/span/span[1]").text
      expect(default_price.gsub("$","").to_i).to be > 0
      expect(price_with_sale.gsub("$","").to_i).to be > 0
      expect(default_price.gsub("$","").to_i).to be > price_with_sale.gsub("$","").to_i
    end
    end

  def self.remember_items_parameters
    $venus_stored_information['plp_items'] = get_items_names
    p "Items remembered"
  end

  def self.get_items_names
    items_names_locator = vn_get_product_list_page_content['multiple_items_locators']['items_names']
    p items_count = find_all(:xpath, items_names_locator).count
    expect(items_count).to be > 0
    items_names_array = []
    (1..items_count).each do |item_number|
      item_name_locator = items_names_locator + "[#{item_number}]"
      VN_AllPage.scroll_to_element(item_name_locator)
      items_names_array.push find(:xpath, item_name_locator).text
    end
    p items_names_array
  end

  def self.expect_correct_plp_items_count
    total_items_locator = vn_get_product_list_page_content['base_locators']['total_items']
    p total_items_text = find(:xpath, total_items_locator).text
    p total_items_value = total_items_text.gsub(' ','').gsub(',',' ').match(/\d+/).to_s.to_i
    expect(total_items_value).to be > 0
    p "Items count on plp is correct"
  end

  def self.expect_extended_product_list_page_content
    p "Expecting extended items content"
    items_multiple_locators = vn_get_product_list_page_content['multiple_items_locators']
    items_count = find_all(:xpath, "(//div[contains(@id,'item-')])").count
    expect(items_count).to be >= 1
    (1..items_count).each do |item_number|
      items_multiple_locators.each do |name, locator|
        item_element_locator = locator + "[#{item_number}]"
        VN_AllPage.scroll_to_element(item_element_locator)
        page.assert_selector(:xpath, item_element_locator)
        p "I see #{name} on item #{item_number}"
      end
    end
  end

  def self.click_view_filter_results
    page.assert_selector(:xpath, "//button//span[contains(text(),'View Results' )]")
    find(:xpath,"//button//span[contains(text(),'View Results' )]").click
    sleep 10
    p "I clicked view_results_button"
  end

  def self.check_current_items_become_less_or_equal
    new_count = find(:xpath, "//div[@data-page='Subcategory']//span[contains(., 'total items')]")
                    .text.match(/\d+/).to_s.to_i
    expect(new_count).to be <= $base_items_count
  end

  def self.check_items_count_equal
    new_count = find(:xpath, "//div[@data-page='Subcategory']//span[contains(., 'total items')]")
                    .text.match(/\d+/).to_s.to_i
    p "#{new_count} and old count: #{$base_items_count}"
    expect(new_count). to eq $base_items_count
  end

  #Labels are used because Capybara could not find input
  #Maybe some nodes are staying over it
  def self.select_random_size_filter_option
    count = find_all(:xpath, "(//label)").count
    p count
    random_parameter = Random.rand(1..count)
    find(:xpath, "(//label)[#{random_parameter}]").click
  end

  def self.open_size_filter
    page.assert_selector(:xpath, "//span[text()='Filter']/ancestor-or-self::button")
    find(:xpath,"//span[text()='Filter']/ancestor-or-self::button").click
    sleep 3
    find(:xpath, "//*[contains(text(), 'By Size')]").click
    p  "I opened the Filter"
  end

  def self.update_items_count
    $base_items_count = find(:xpath, "//div[@data-page='Subcategory']//span[contains(., 'total items')]")
                            .text.match(/\d+/).to_s.to_i
    p "current items count: #{$base_items_count}"
  end

  def self.clear_all_filters
    sleep 3
    page.assert_selector(:xpath, "//span[text()='Clear All']/ancestor-or-self::button")
    page.assert_selector(:xpath, "//input[@type = 'checkbox']/preceding::label")
    find(:xpath, "//span[text()='Clear All']/ancestor-or-self::button").click
    p  "I cleared filter selections"
    sleep 2
  end

  def self.check_filter_button_value(expected_value)
    page.assert_selector(:xpath, "//div[@role='button' and text()= '#{expected_value}']")
  end

  def self.navigate_to_page(page_name)
    p page_path = vn_get_product_list_page_content['plp_links'][page_name]
    page.visit BASE_URL + page_path
    p "I am on #{BASE_URL + page_path}"
    my_set_cookie('smartbanner-closed', 'true')
    my_set_cookie('ConsentToCookies', 'true')
  end

end

