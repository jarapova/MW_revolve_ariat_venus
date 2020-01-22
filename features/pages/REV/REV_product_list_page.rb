require 'capybara/cucumber'

class REV_ProductListingPage
  extend Capybara::DSL
  extend RSpec::Matchers

  PRODUCT_LIST_PAGE_PREFIX = "revolve:product_list_page:"

  def self.visit_product_list_page
    page.visit rev_get_plp_link
    p "I am on plp"
  end

  def self.expect_product_list_content
    wait_placeholders
    rev_get_plp_content['base_plp_locators'].each do |name, locator|
      page.assert_selector(:xpath, locator) #ta_bug
      p "I see #{name} on plp"
    end
    main_text_locator = rev_get_plp_content['base_plp_locators']['main_text']
    main_text = find(:xpath, main_text_locator).text #ta_bug
    expect(main_text).should_not eq ""
    expect_items_content
  end

  def self.expect_extended_items_content
    VN_AllPage.update_page
    all_items_locator = rev_get_plp_content['all_items_plp_locators']['all_items']
    all_items_count = find_all(:xpath, all_items_locator).count
    expect(all_items_count).to be > 0
    (1..all_items_count).each do |item_number|
      rev_get_plp_content['all_items_plp_locators'].each do |name, locator|
        item_locator = locator + "[#{item_number}]"
        VN_AllPage.scroll_to_element(item_locator)
        page.assert_selector(:xpath, item_locator)
        p "I see #{name} in #{item_number} item"
      end
    end
  end

  def self.expect_items_content
    VN_AllPage.update_page
    all_items_locator = rev_get_plp_content['all_items_plp_locators']['all_items']
    all_items_count = find_all(:xpath, all_items_locator).count
    expect(all_items_count).to be > 0
    (1..all_items_count).each do |item_number|
      rev_get_plp_content['all_items_plp_locators'].each do |name, locator|
        page.assert_selector(:xpath, locator + "[#{item_number}]")
        p "I see #{name} in #{item_number} item"
      end
    end
  end

  def self.expect_min_product_list_page_content
    rev_get_plp_content['base_plp_locators'].each do |name, locator|
      p name
      page.assert_selector(:xpath, locator) if ((name != "sort_button") && (name != "filter_button"))
      p "I see #{name}"
    end
    expect_items_content
    main_text_locator = rev_get_plp_content['base_plp_locators']['main_text']
    main_text = find(:xpath, main_text_locator).text
    expect(main_text).should_not eq ""
    p "Main text is not empty"
  end

  def self.click_random_item_favourites_button
    all_items_locator = rev_get_plp_content['all_items_plp_locators']['all_items']
    all_items_count = find_all(:xpath, all_items_locator).count
    random_number = Random.rand(1..all_items_count)
    favourites_buttons_locator = rev_get_plp_content['all_items_plp_locators']['favorites_button']
    find(:xpath, favourites_buttons_locator + "[#{random_number}]").click
    p "clicked on #{random_number} item wishlist button"
  end

  def self.click_filter_button
    filter_locator = rev_get_plp_content['base_plp_locators']['filter_button']
    ta_locator = PRODUCT_LIST_PAGE_PREFIX + "filter_button"
    find(:xpath, m_ta(ta_locator, filter_locator)).click
    sleep 3
    p "I clicked filter_button"
  end

  def self.click_sort_button
    sleep 1
    sort_button_locator = rev_get_plp_content['base_plp_locators']['sort_button']
    ta_locator = PRODUCT_LIST_PAGE_PREFIX + "sort_button"
    find(:xpath, m_ta(ta_locator, sort_button_locator)).click
    sleep 1
    p "I clicked sort_button"
  end

  def self.click_sort_category(category_name)
    ta_locator = PRODUCT_LIST_PAGE_PREFIX + "sort:" + category_name.gsub(' ', '').gsub(':', '') + "_category"
    find(:xpath, m_ta(ta_locator,
                      "//div[text()='Sort']/following-sibling::div//span[contains(., '#{category_name}')]")).click
    p "I selected #{category_name}"
    wait_progress_bar
  end

  def self.click_close_sort_button
    sleep 1
    find(:xpath, m_ta(PRODUCT_LIST_PAGE_PREFIX + "sort:close_button",
                      "//div[text()='Sort']/following-sibling::button")).click
  end

  def self.click_close_filter_button
    sleep 4
    find(:xpath, "(//div[text()='Filter']/../../..//button[span])[1]").click
    p "I closed filter popup"
  end

  def self.get_actual_product_prices
    prices = []
    item_prices_locator = rev_get_plp_content['all_items_plp_locators']['item_price']
    # ta_locator = PRODUCT_LIST_PAGE_PREFIX + "item_price"
    items_count = find_all(:xpath, item_prices_locator).count
    (1..items_count).each do |item_number|
      locator = "(//*[contains(@id, 'item')]//p[3])[#{item_number}]"
      p item_number
      p sale_price = find(:xpath, locator, visible: :all).text.sub(",", "")
      if sale_price == ""
        p "sale is empty"
        item_price = find(:xpath, item_prices_locator + "[#{item_number}]").text.sub(",", "") #ta_bug
      else
        p item_price = sale_price
      end
      p item_price = item_price.match(/(\d+([.]?)[\d]*)$/).to_s
      prices.push(item_price.to_f)
    end
    prices
  end

  def self.check_price_content(content_type)
    p "Check content"
    prices = get_actual_product_prices
    p prices
    if content_type == 'high_to_low'
      (1...prices.count).each do |i|
        expect(prices[i-1]).to be >= prices[i]
      end
    elsif content_type == 'low_to_high'
      (1...prices.count).each do |i|
        expect(prices[i-1]).to be <= prices[i]
      end
    end
  end

  def self.get_current_items_count
    total_items_count_locator = rev_get_plp_content['base_plp_locators']['total_items']
    # ta_locator = PRODUCT_LIST_PAGE_PREFIX + "total_items"
    p find(:xpath, total_items_count_locator).text.gsub(' ','').gsub(',', '').to_s.to_i #ta_bug
  end

  def self.click_filter_category(filter_category)
    filter_category = filter_category.sub("_filter", "")
    find(:xpath, "//h6[text()='#{filter_category.capitalize}']").click #ta_bug
    p "I clicked #{filter_category.capitalize} filter_category"
  end

  def self.select_filter_accordion_category(filter_option)
    if filter_option.include? 'random'
      all_options_locator = rev_get_plp_content['multiple_locators']['filter_options']
      options_count = find_all(:xpath, all_options_locator).count
      random_options_number = Random.rand(1..options_count)
      ta_locator = PRODUCT_LIST_PAGE_PREFIX + "filter_accordion_category:" + random_options_number.to_s
      find(:xpath, m_ta(ta_locator, all_options_locator + "[#{random_options_number}]")).click
    else
      locator = "//div[@role='document' and contains(div, 'Filter')]//span[text() = '#{filter_option}']/.."
      ta_locator = PRODUCT_LIST_PAGE_PREFIX +
          "filter_accordion_category:" +
          filter_option.gsub('.', '').gsub(' ', '').gsub('&', '').gsub('+', '').gsub('$', '').gsub('-', '').downcase +
          "_filter"
      scroll_to_element(m_ta(ta_locator, locator), 1)
      find(:xpath, m_ta(ta_locator, locator)).click
      p "I clicked #{filter_option} filter accordion category"
    end
  end

  def self.click_view_filter_results
    find(:xpath, "//*[text()='View Results']").click
    wait_progress_bar
  end

  def self.check_current_items_become_less_or_equal
    p "Current total items count is #{get_current_items_count}"
    expect($revolve_stored_information['items_count']).to be >= get_current_items_count
  end

  def self.check_items_count_equal
    expect($revolve_stored_information['items_count']).to eql(get_current_items_count)
    p "Current items are equal to previous value"
  end

  def self.expect_content(content_name)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name == 'product_list_page_content'
      expect_product_list_content
    elsif content_name == 'high_to_low_content'
      check_price_content('high_to_low')
    elsif content_name == 'low_to_high_content'
      check_price_content('low_to_high')
    elsif content_name == 'account_modal_content'
      expect_account_modal_content
    elsif content_name == 'sale_prices_content'
      expect_sales_prices
    elsif content_name == 'min_product_list_page_content'
      expect_min_product_list_page_content
    elsif content_name == 'extended_product_list_page_content'
      expect_extended_items_content
    elsif content_name == 'different_plp_items'
      expect_different_plp_items
    elsif content_name == 'headless_product_list_page_content'
      expect_headless_plp_content
    elsif content_name == 'empty_search_result_page'
      p "Expecting empty_search_result_page"
      page.assert_selector(:xpath, "//*[text()='0 items']")
      page.assert_selector(:xpath, "//*[contains(text(),'No products')]")
      p "I see empty_search_result_page"
    elsif content_name == 'show_more_pagination_button'
      pagination_button_locator = rev_get_plp_content['optional_locators']['show_more_pagination_button']
      page.assert_selector(:xpath, pagination_button_locator)
    elsif content_name == 'total_items_count'
      actual_count = get_current_items_count
      expect(actual_count).to be > 0
      p "Items count is correct"
    elsif content_name == 'designers_list'
      VN_AllPage.update_page
      brands_count = find_all(:xpath, "//ul[contains(@class,'stacked-menu')]//li").count
      expect(brands_count).to be > 100
    elsif content_name == 'plp_with_filter_widget'
      expect_plp_with_filter_widget
    elsif content_name == 'category_dropdown_content'
      expect_category_dropdown_content
    end
  end

  def self.expect_category_dropdown_content
    subcategories_locator = rev_get_plp_content['multiple_locators']['category_dropdown_subcategories']
    p subcategories_count = find_all(:xpath, subcategories_locator).count
    expect(subcategories_count).to be >= 1
    p "I see #{subcategories_count}"
  end

  def self.expect_plp_with_filter_widget
    wait_placeholders
    rev_get_plp_content['base_plp_locators'].each do |name, locator|
      page.assert_selector(:xpath, locator) unless name == 'main_text'
      p "I see #{name} on plp"
    end
    page.assert_selector(:xpath, rev_get_plp_content['optional_locators']['donde_filter'])
    p "I see donde_filter on plp"
    expect_items_content
  end

  def self.click_element(element_to_click)
    if element_to_click.include? 'random_item_favourites_button'
      click_random_item_favourites_button
    elsif element_to_click.include? 'random_item_name'
      all_items_locator = rev_get_plp_content['all_items_plp_locators']['item_name']
      p items_count = find_all(:xpath, all_items_locator).count
      random_number = Random.rand(1..items_count)
      p find(:xpath, all_items_locator + "[#{random_number}]").text
      find(:xpath, all_items_locator + "[#{random_number}]").click
      p "I clicked on #{random_number} item"
    elsif element_to_click == 'random_item_favorites_button'
      all_items_locator = rev_get_plp_content['all_items_plp_locators']['item_name']
      items_count = find_all(:xpath, all_items_locator).count
      random_number = Random.rand(1..items_count)
      favorites_buttons = rev_get_plp_content['all_items_plp_locators']['favorites_button']
      favorites_button_locator = favorites_buttons + "[#{random_number}]"
      VN_AllPage.scroll_to_element(favorites_button_locator)
      sleep 2
      find(:xpath, favorites_button_locator).click
      sleep 3
      p "Clicked on #{random_number} favorite button"
    elsif element_to_click == 'random_not_pwa_item_name'
      p click_random_element("(//*[@class='container']//img[contains(@class,'image')])")
    elsif element_to_click.include? 'category_dropdown'
      category_name = element_to_click.sub('_category_dropdown','')
      click_category_drop_down(category_name)
    elsif element_to_click == 'random_dropdown_category'
      click_random_element(rev_get_plp_content['multiple_locators']['category_dropdown_subcategories'])
    else
      element_locator = rev_get_plp_content['optional_locators'][element_to_click]
      find(:xpath, m_ta(PRODUCT_LIST_PAGE_PREFIX + element_to_click, element_locator)).click
    end
  end

  def self.expect_sales_prices
    sales_items_locator = "(//*[contains(@id, 'item')]//p[3])"
    default_price_locator = rev_get_plp_content['all_items_plp_locators']['item_price']
    ta_default_price_locator = PRODUCT_LIST_PAGE_PREFIX + "item_price"
    ta_sale_price_locator = PRODUCT_LIST_PAGE_PREFIX + "sale_price"
    items_count = find_all(:xpath, default_price_locator).count
    (1..items_count).each do |item_number|
      sale_price_text = find(:xpath, m_ta(ta_sale_price_locator + item_number.to_s,
                                          sales_items_locator + "[#{item_number}]")).text.sub(",", "")
      default_price_text = find(:xpath, default_price_locator + "[#{item_number}]").text.sub(",", "")

      sale_price = sale_price_text.match(/(\d+([.]?)[\d]*)$/).to_s.to_f
      default_price = default_price_text.match(/(\d+([.]?)[\d]*)$/).to_s.to_f

      p "default price is #{default_price} and sale price is #{sale_price} on item #{item_number}"
      expect(sale_price).to be < default_price
    end
  end

  def self.expect_account_modal_content
    rev_get_plp_content['account_modal_locators'].each do |name, locator|
      page.assert_selector(:xpath, m_ta(PRODUCT_LIST_PAGE_PREFIX + name, locator))
      p "I see #{name}"
    end
  end

  def self.click_category_drop_down(category_name)
    category_name.capitalize!
    locator = "//*[@data-page='Subcategory']//*[contains(text(),'#{category_name}')] | //*[@data-page='subcategory']//*[contains(text(),'#{category_name}')]"
    find(:xpath, locator).click
    sleep 1
    p "I clicked #{category_name} category dropdown"
  end

  def self.remember_items_count_on_plp
    p $revolve_stored_information['items_count'] = get_current_items_count
  end

  def self.check_base_element_with_value(element_name, expected_element_text) #ta_bug
    if element_name.include? 'item'
      check_product_element_with_value(element_name, expected_element_text)
    elsif element_name == 'filter_text'
      filter_text_locator = "//button//span[contains(text(), 'Filter')]//following-sibling::*[text()]"
      page.assert_selector(:xpath, filter_text_locator)
      filter_text = find(:xpath, filter_text_locator).text
      expect(filter_text).to eq expected_element_text
      p "Filter text is correct"
    elsif element_name == 'text'
      page.assert_selector(:xpath, "//*[contains(text(), '#{expected_element_text}')]")
    else
      element_locator = rev_get_plp_content['base_plp_locators'][element_name]
      actual_text = find(:xpath, element_locator).text
      if expected_element_text.include? 'item'
        p item_name = expected_element_text.sub('_brand_name','')
        p expected_text = rev_get_item_parameters(item_name)['content_to_check']['brand_name']
      else
        p expected_text = expected_element_text
      end
        expect(actual_text.downcase).to eql(expected_text.downcase)
      p "#{element_name} is correct and has value #{expected_text}"
    end
  end

  def self.wait_progress_bar
    p "Waiting for progress bar"
    p time = Time.now
    loop do
      progressbar = find_all(:xpath, "//*[@role='progressbar']", wait: false).count
      sleep 0.5 if progressbar >= 1
      break if (progressbar == 0 or (Time.now - time) > MAX_WAIT_PLACEHOLDERS)
    end
    if (Time.now - time) > MAX_WAIT_PLACEHOLDERS
      raise StandardError.new "Idling progressbar"
    end
    p "Progress bar is closed"
  end

  def self.wait_placeholders
    p "Waiting for placeholders"
    time = Time.now
    loop do
      placeholders = find_all(:xpath, "//div[@style='flex: 1 1 0%;']", wait: false).count
      sleep 0.5 if placeholders >= 1
      break if (placeholders == 0 or (Time.now - time) > MAX_WAIT_PLACEHOLDERS)
    end
    if (Time.now - time) > MAX_WAIT_PLACEHOLDERS
      raise StandardError.new "Waiting for placeholders is too long"
    end
    p "Placeholders are loaded"
  end

  def self.check_product_element_with_value(element, expected_text)
    p "Expecting #{element} with #{expected_text}"
    all_items_locator = rev_get_plp_content['all_items_plp_locators']['all_items']
    all_items_count = find_all(:xpath, all_items_locator).count
    locators = rev_get_plp_content['all_items_plp_locators']
    locators = locators.merge(rev_get_plp_content['optional_locators'])
    items_locator = locators[element]
    alt_price_locator = rev_get_plp_content['all_items_plp_locators']['item_price']
    (1..all_items_count).each do |item_number|
      if element.include? 'price'
        actual_text = find(:xpath, m_ta(PRODUCT_LIST_PAGE_PREFIX + element + item_number.to_s,
                                        items_locator + "[#{item_number}]"), visible: :all).text
        if actual_text == ''
          p "Replacing actual text"
          p actual_text = find(:xpath, m_ta(PRODUCT_LIST_PAGE_PREFIX + element + "alt" + item_number.to_s,
                                            alt_price_locator + "[#{item_number}]")).text
        end
        if expected_text.include? 'less'
          actual_price = actual_text.match(/\d+/).to_s.to_i
          expected_price = expected_text.sub('less_', '').to_i
          expect(actual_price).to be <= expected_price
          p "Item price #{actual_price} is less then #{expected_price} on #{item_number} item"
        end
      else
        actual_text = find(:xpath, m_ta(PRODUCT_LIST_PAGE_PREFIX + element + item_number.to_s,
                                        items_locator + "[#{item_number}]")).text
        expect(actual_text).to eq expected_text
        p "Item #{item_number} with element #{element} has correct #{expected_text}"
      end
    end
  end

  def self.expect_filter_content(content_name)
    if content_name == 'swatches_content'
      all_filter_options_locator = rev_get_plp_content['multiple_locators']['filter_options']
      options_count = find_all(:xpath, all_filter_options_locator).count
      expect(options_count).to be > 0
      (1..options_count).each do |option_number|
        page.assert_selector(:xpath, "(#{all_filter_options_locator}//img[@src])[#{option_number}]")
        p "I see swatch on #{option_number} filter option"
      end
    elsif content_name.include? 'tab'
      content_name.sub!('_tab', '')
      page.assert_selector(:xpath, m_ta(PRODUCT_LIST_PAGE_PREFIX + content_name + "_filter_tab",
                                        "//div[@role='document' and contains(., 'Filter')]//*[text()='#{content_name.capitalize}']"))
      p "I see #{content_name} tab"
    else
      locators = rev_get_plp_content['filter_locators']
      page.assert_selector(:xpath, locators[content_name])
      p "I clicked #{content_name}"
    end
  end

  def self.expect_filter_price_in_range(start_value, end_value)
    p "Expecting item price in range #{start_value} - #{end_value}"
    prices = get_actual_product_prices
    p prices
    prices.each do |item_price|
      expect(item_price).to be_between(start_value.to_f, end_value.to_f)
    end
    # all_items_locator = rev_get_plp_content['all_items_plp_locators']['all_items']
    # item_price_locator = rev_get_plp_content['all_items_plp_locators']['item_price']
    # all_items_count = find_all(:xpath, all_items_locator).count
    # (1..all_items_count).each do |item_number|
    #   actual_price = find(:xpath, item_price_locator + "[#{item_number}]").text.match(/\d+/).to_s.to_i #ta_bug
    #   p actual_price
    #   expect(actual_price).to be_between(start_value.to_i, end_value.to_i)
    #   p "#{item_number} item price are between #{start_value} and #{end_value}"
    # end
  end

  def self.click_modal_window(element_to_click)
    if element_to_click == 'grey_aura_outside'
      main_text_locator = rev_get_plp_content['account_modal_locators']['main_text']
      find(:xpath, "#{main_text_locator}/../..").click
      sleep 3
      p "Closed"
    else
      element_locator = rev_get_plp_content['account_modal_locators'][element_to_click]
      find(:xpath, m_ta(PRODUCT_LIST_PAGE_PREFIX + element_to_click, element_locator)).click
    end
  end

  def self.expect_headless_plp_content
    wait_placeholders
    locators = rev_get_plp_content['base_plp_locators']
    page.assert_selector(:xpath, locators['main_text'])
    page.assert_selector(:xpath, locators['total_items'])
    expect_items_content
  end

  # def self.click_designer(designer_name)
  #   find(:xpath, %{//a[contains(text(), "#{designer_name}")]}).click
  #   p "I clicked #{designer_name}"
  # end

  def self.expect_no_content(content_name)
    if content_name == 'sort_modal'
      page.assert_no_selector(:xpath, "//*[@role='document' and contains(.,'Sort')]")
    elsif content_name == 'filter_text'
      page.assert_no_selector(:xpath, "//button//span[contains(text(), 'Filter')]//following-sibling::*[text()]")
    end
  end

  def self.remember_content(content_name)
    if content_name == "items_names"
      $revolve_stored_information[content_name] = get_items_names
    end
  end

  def self.get_items_names
    items_names = []
    VN_AllPage.update_page
    items_names_locator = rev_get_plp_content['all_items_plp_locators']['item_name']
    find_all(:xpath, items_names_locator).each do |element|
      items_names.push(element.text)
    end
    p items_names
  end

  def self.expect_different_plp_items
    old_items = $revolve_stored_information['items_names']
    old_items_count = old_items.count
    extended_items = get_items_names
    extended_items_count = extended_items.count
    new_items = extended_items[old_items_count..extended_items_count-1]
    p "Old items: #{old_items}"
    p "New items: #{new_items}"
    expect(old_items).not_to match_array(new_items)
    p "Items are different on PLP"
  end

  def self.click_filter_widget_category(category_name)
    category_button_locator = "//*[@class='donde-question' and descendant-or-self::*[text()='#{category_name}']]"
    page.assert_selector(:xpath, category_button_locator)
    find(:xpath, category_button_locator).click
    sleep 3
    p "I clicked #{category_name} category on filter widget"
  end

  def self.click_filter_widget_option_by_number(option_number)
    filter_options_locator = rev_get_plp_content['multiple_locators']['filter_widget_options']
    filter_option_locator = filter_options_locator + "[#{option_number}]"
    page.assert_selector(:xpath, filter_option_locator)
    find(:xpath, filter_option_locator).click
    sleep 5
    p "I clicked #{option_number} filter widget option"
  end

  def self.click_filter_widget_element(element_name)
    if element_name.include? 'option'
      option_number = element_name.sub('_option','')
      sleep 1
      if option_number == 'random'
        options_locator = rev_get_plp_content['multiple_locators']['filter_widget_options']
        options_count = find_all(:xpath, options_locator).count
        click_filter_widget_option_by_number(Random.rand(1..options_count))
      else
        click_filter_widget_option_by_number(option_number)
      end
    elsif element_name.include? 'category'
      category_name = element_name.sub('_category','')
      click_filter_widget_category(category_name)
    end
  end

end
