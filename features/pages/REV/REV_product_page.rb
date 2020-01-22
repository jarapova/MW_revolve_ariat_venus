# In this module we collecting methods for Product page of REVOLVE
require 'capybara/cucumber'

module REV_ProductPage
  extend Capybara::DSL
  extend RSpec::Matchers

  PRODUCT_PAGE_PREFIX = "revolve:product_page:"

  def self.expect_content(content_name)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name.include? 'product_page_content'
      REV_ProductListingPage.wait_placeholders
      VN_AllPage.update_page
      locators = rev_get_pdp_content['base_pdp_locators']
      p locators
      locators.each do |name, locator|
        p "Expecting #{name} and #{locator}"
        page.assert_selector(:xpath, locator)
        p "I see #{name} on pdp"
      end
      p "Expecting description tabs"
      rev_get_pdp_content['description_tabs_locators'].each do |name, locator|
        page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + name, locator))
        p "I see #{name} on pdp in description"
      end
    elsif content_name.include? 'price_with_sale'
      sale_price_locator = rev_get_pdp_content['optional_locators']['sale_price']
      page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "sale_price", sale_price_locator))
      sale_price = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "sale_price",
                                     sale_price_locator)).text.sub(",", "").match(/(\d+([.]?)[\d]*)/).to_s.to_f
      default_price_locator = rev_get_pdp_content['base_pdp_locators']['default_price']
      default_price = find(:xpath, default_price_locator).text.sub(",", "").match(/(\d+([.]?)[\d]*)/).to_s.to_f
      p "sale price #{sale_price} and default price #{default_price}"
      expect(sale_price).to be < default_price
    elsif content_name.include? 'test_content'
      item_id = content_name.sub('_test_content', '')
      content_to_check = rev_get_item_parameters(item_id)['content_to_check']
      content_to_check.each do |name, expected_text|
        p "expecting #{name} to be correct"
        locator = rev_get_pdp_content['base_pdp_locators'][name]
        actual_text = find(:xpath, locator).text #ta_bug
        expect(actual_text.downcase).to eq expected_text.downcase
        p "product #{name} are correct"
      end
    elsif content_name == 'product_images_content'
      expect_product_images_content
    elsif content_name == 'zoom_image_content'
      expect_zoomed_image_content
    elsif content_name == 'one_size_button'
      one_size_locator = rev_get_pdp_content['optional_locators']['one_size']
      page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "one_size", one_size_locator))
      available_sizes_locator = rev_get_pdp_content['multiple_locators']['available_sizes']
      sizes_count = find_all(:xpath, available_sizes_locator).count
      expect(sizes_count).to eq 1
      p "I see one size button and it is the only size button"
    elsif content_name == 'select_a_size_message'
      page.assert_selector(:xpath, "//*[contains(text(),'lease select a size')]")
      p "Error messages have appeared"
    elsif content_name == 'account_modal_content'
      REV_ProductListingPage.expect_account_modal_content
    elsif content_name.include? 'description'
      expect_description_content(content_name)
    elsif content_name == 'no_about_brand_tab'
      brand_tab_locator = rev_get_pdp_content['optional_locators']['about_brand_tab']
      page.assert_no_selector(:xpath, brand_tab_locator)
      p "I can`t see brand tab"
    elsif content_name == 'shipping_content'
      expect_shipping_content
    elsif content_name == 'recently_viewed_content'
      expect_recently_viewed_content
    elsif content_name == 'similar_items_content'
      expect_similar_items_content
    elsif content_name == 'ratings_and_review_content'
      expect_ratings_and_reviews_content
    elsif content_name == 'complete_the_look_section_content'
      expect_complete_the_look_section
    elsif content_name == 'preorder_message'
      expect_preorder_message
    elsif content_name == 'afterpay_content'
      REV_CartPage.expect_afterpay_content
    elsif content_name == 'afterpay_modal_content'
      REV_CartPage.expect_afterpay_modal_content
    elsif content_name == 'beauty_message'
      REV_CartPage.expect_content('beauty_warning_message')
    elsif content_name == 'pop_up_content'
      expect_pop_up_content
    else
      optional_locators = rev_get_pdp_content['optional_locators']
      page.assert_selector(:xpath, optional_locators[content_name])
       p "I see #{content_name}"
    end
  end

  def self.expect_pop_up_content
    p "Expecting pop up content"
    rev_get_pdp_content['pop_up_modal_locators'].each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name} on pop_up_modal"
    end
    close_pop_up_button_locator = rev_get_pdp_content['optional_locators']['close_view_bag_modal_button']
    page.assert_selector(:xpath, close_pop_up_button_locator)
    p "I see close_view_bag_modal_button"
  end

  def self.go_to_pdp(item_id)
    link = rev_get_item_parameters(item_id)['pdp_link']
    visit BASE_URL + link
  end

  def self.expect_main_product_image
    main_image_locator = rev_get_pdp_content['base_pdp_locators']['main_image']
    page.assert_selector(:xpath, main_image_locator) #ta_bug
    p "I see main_image"
    selected_image_tab_locator = rev_get_pdp_content['base_pdp_locators']['selected_image_tab']
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "selected_image_tab", selected_image_tab_locator))
    p "I see selected_image_tab"
  end

  def self.expect_zoomed_image
    zoomed_image_locator = "//div[contains(@class, 'mui-fixed') and @aria-hidden]//following-sibling::div/div[not(@class)]//img[@src]"
    page.assert_selector(:xpath, zoomed_image_locator)
    zoomed_selected_tab_locator = "(//div[contains(@class, 'mui-fixed') and @aria-hidden]//following-sibling::div//button[@aria-selected='true'])"
    page.assert_selector(:xpath, zoomed_selected_tab_locator)
  end

  def self.click_zoomed_image(image_number)
    all_zoomed_tabs_locator = rev_get_pdp_content['multiple_locators']['zoomed_images']
    find(:xpath, all_zoomed_tabs_locator + "[#{image_number}]").click
    p "I clicked on #{image_number} zoomed image"
  end

  def self.click_element(element_name)
    if element_name.include? 'image'
      element_name.sub!('image_', '')
      click_image_tab(element_name.to_i)
      p "clicked #{element_name} image on pdp"
    elsif element_name.include? 'item_color'
      element_name.sub!('_item_color', '')
      element_name = camel_case(element_name)
      p "I want to click on #{element_name} color"
      click_color(element_name)
      sleep 1
    elsif element_name == 'available_size_button'
      click_available_size
    elsif element_name == 'random_similar_item'
      item_names_locator = rev_get_pdp_content['similar_items_multiple_locators']['similar_items_names']
      items_count = find_all(:xpath, item_names_locator).count
      random_number = Random.rand(1..items_count)
      find(:xpath, item_names_locator + "[#{random_number}]").click
      p "I clicked #{random_number} item on similar items carousel"
    elsif element_name == "random_complete_the_look_item"
      items_names_locator = rev_get_pdp_content['complete_the_look_multiple_locators']['item_names']
      items_count = find_all(:xpath, items_names_locator).count
      random_number = Random.rand(1..items_count)
      find(:xpath, items_names_locator + "[#{random_number}]").click
      p "I clicked #{random_number} complete the look item"
    else
      p "Expecting another locators"
      # Dont use merge! (it doesn`t clear hash after test so on the new run you will get wrong hash with useless stuff)
      another_locators = rev_get_pdp_content['base_pdp_locators']
      another_locators = another_locators.merge(rev_get_pdp_content['description_tabs_locators'])
      another_locators = another_locators.merge(rev_get_pdp_content['optional_locators'])
      another_locators = another_locators.merge(rev_get_pdp_content['description_info_locators'])
      sleep 1.5 if element_name.include? '_tab'
      p "I am clicking on #{element_name} #{another_locators[element_name]}"
      find(:xpath, another_locators[element_name]).click #ta_bug
      sleep 2 if element_name == 'add_to_bag_button'
      p "I clicked #{element_name}"
    end
  end

  def self.click_image_tab(image_number)
    image_tabs_locator = rev_get_pdp_content['multiple_locators']['item_images_tabs']
    find(:xpath, image_tabs_locator + "[#{image_number}]").click
  end

  def self.click_image_zoom_button
    zoom_button_locator = rev_get_pdp_content['base_pdp_locators']['image_zoom_button']
    find(:xpath, zoom_button_locator).click
    p "I clicked zoomed image button on pdp"
  end

  def self.click_available_size
    available_sizes_locator = rev_get_pdp_content['multiple_locators']['available_sizes']
    available_sizes_count = find_all(:xpath, available_sizes_locator).count
    random_number = Random.rand(1..available_sizes_count)
    size_text = find(:xpath, available_sizes_locator + "[#{random_number}]")["aria-label"]
    scroll_page(0.3, 2)
    find(:xpath, available_sizes_locator + "[#{random_number}]").click
    sleep 1
    p "I clicked #{size_text}"
  end

  def self.click_add_to_bag
    add_to_bag_button_locator = rev_get_pdp_content['base_pdp_locators']['add_to_bag_button']
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "add_to_bag_button",
                                      add_to_bag_button_locator))
    find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "add_to_bag_button",
                      add_to_bag_button_locator)).click
    p "add_to_bag_button clicked"
  end

  # def self.click_color_number(color_number)
  #   all_colors_locator = rev_get_pdp_content['multiple_locators']['item_colors']
  #   find(:xpath, all_colors_locator + "[#{color_number}]").click
  #   p "I clicked #{color_number}"
  # end

  def self.click_color(color_name)
    locator = "(//p[text()='Color']//following-sibling::div//div[@amp-bind]/button[@type='button' and @aria-label='#{color_name}'])"
    ta_locator_name = color_name.sub(" ", "").sub("&", "")
    find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + ta_locator_name, locator)).click
    p "I clicked color #{color_name} color"
  end

  def self.expect_element_with_value(element_name, element_value)
    if element_name == 'item_color'
      check_color_with_text(element_value)
    elsif element_name == 'product_size'
      size_locator = "(//p[text()='Size']//following-sibling::div" +
          "//div[@amp-bind]/button[not(@disabled)])//*[text()='#{element_value}']"
      ta_locator = PRODUCT_PAGE_PREFIX + "product_size_#{element_value}"
      page.assert_selector(:xpath, m_ta(ta_locator, size_locator))
    elsif element_name == 'qty_current_value'
      locators = rev_get_pdp_content['base_pdp_locators']
      actual_text = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + element_name,
                                      locators[element_name]))[:value]
      expect(actual_text).to eq element_value
      p "I see #{element_name} with correct value"
    end
  end

  def self.check_color_with_text(expected_text)
    default_color_locator = rev_get_pdp_content['base_pdp_locators']['default_color']
    actual_text = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "default_color", default_color_locator)).text
    expect(actual_text).to eql(expected_text)
    p "Colors are equal"
  end

  def self.remember_item_parameters(item_name)
    $revolve_stored_information[item_name] = get_item_parameters
    p $revolve_stored_information
  end

  def self.get_item_parameters
    p "Getting item parameters"
    item_name_locator = rev_get_pdp_content['base_pdp_locators']['main_text']
    item_price_locator = rev_get_pdp_content['base_pdp_locators']['default_price']
    #Item contains color_text in name, so color_text should be deleted
    color_text_locator = rev_get_pdp_content['base_pdp_locators']['default_color']
    color_text = find(:xpath, color_text_locator).text
    item = []
    p item_name = find(:xpath, item_name_locator).text
    p item.push(item_name.gsub(" in #{color_text}", ""))
    item.push(find(:xpath, item_price_locator).text)
    p item
  end

  def self.expect_product_images_content
    image_tabs_locator = rev_get_pdp_content['multiple_locators']['item_images_tabs']
    image_tabs_count = find_all(:xpath, image_tabs_locator).count
    expect(image_tabs_count).to be > 1
    (1..image_tabs_count).each do |image_number|
      find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "item_images_tabs" + image_number.to_s,
                        image_tabs_locator + "[#{image_number}]")).click
      p "Clicked #{image_number} image"
      expect_main_product_image
    end
  end

  def self.expect_zoomed_image_content
    all_zoomed_images_locator = rev_get_pdp_content['multiple_locators']['zoomed_images']
    zoomed_images_count = find_all(:xpath, all_zoomed_images_locator).count
    (1..zoomed_images_count).each do |image_number|
      click_zoomed_image(image_number)
      expect_zoomed_image
    end
  end

  def self.click_view_bag_popup
    alert_dialog_locator = rev_get_pdp_content['pop_up_modal_locators']['view_cart_button']
    find(:xpath, alert_dialog_locator).click
    p "I clicked on view bag popup"
  end

  def self.expect_description_content(content_name)
    if content_name == 'product_details_description'
      p "Expecting product details description tab content"
      description_elements = rev_get_pdp_content['description_info_locators']['description_info_elements']
      find_all(:xpath, description_elements).each do |element|
        p element.text
        expect(element.text.length).to be > 5
      end
      p "Product details tab has expected content"
    elsif content_name == 'size_and_fit_description'
      p "Expecting size and fit description tab content"
      view_size_button = rev_get_pdp_content['description_info_locators']['size_and_fit_button']
      page.assert_selector(:xpath, view_size_button)
      size_and_fit_text_locator = rev_get_pdp_content['description_info_locators']['size_and_fit_info']
      tab_text = find(:xpath, size_and_fit_text_locator).text
      expect(tab_text.length).to be > 5
      p "Size and fit tab has expected content"
    elsif content_name == 'about_brand_description'
      p "Expecting brand description tab content"
      locators = rev_get_pdp_content['optional_locators']
      page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "about_brand_info",
                                        locators['about_brand_info']))
      p tab_text = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "about_brand_info",
                                     locators['about_brand_info'])).text
      expect(tab_text.length).to be > 10
      page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "shop_all_brand_button",
                                        locators['shop_all_brand_button']))
      p "Brand tab has expected content"
    end

  end

  def self.expect_size_and_fit_modal(content_name)
    if content_name == 'measurement_guide_modal_content'
      size_conversion_prefix = PRODUCT_PAGE_PREFIX + "size_conversion_iframe:"
      page.within_frame(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "size_conversion_iframe",
                                     "//iframe[@title='Size Guide']")) do
        modal_locators = rev_get_pdp_content['size_and_fit_modal']['measurement_modal_locators']
        modal_locators.each do |name, locator|
          page.assert_selector(:xpath, m_ta(size_conversion_prefix + name, locator))
          p "I see #{name} on size_and fit modal"
        end
        size_guides_locator = rev_get_pdp_content['size_and_fit_modal']['multiple_locators']['size_guide_markers']
        find_all(:xpath, size_guides_locator).each do |element|
          expect(element.text.length).to be > 10
        end
        find(:xpath, m_ta(size_conversion_prefix + "size_conversion_button",
                          modal_locators['size_conversion_button'])).click
        table_locator = "//div[@class='sizeguide_table_wrap']//table"
        ta_table_locator = size_conversion_prefix + "table"
        page.assert_selector(:xpath, m_ta(ta_table_locator, table_locator))
        table_text = find(:xpath, m_ta(ta_table_locator, table_locator)).text
        expect(table_text.length).to be > 50
        tabs_text = rev_get_pdp_content['size_and_fit_modal']['size_conversion_modal']['tabs_text']
        tabs_text.each do |name, text|
          p text
          page.assert_selector(:xpath, "//ul[contains(@class, 'size')]//li//*[text()='#{text}']")
          p "I see #{name} tab on size modal"
        end
      end
    elsif content_name == 'size_conversion_modal_content'
      expect_size_conversion_modal_content
    end
    page.within_frame(:xpath, "//iframe[@title='Size Guide']") do
      page.assert_selector(:xpath, "//*[contains(text(),'Note:')]")
      page.assert_selector(:xpath, "//div[@class='eagle' and contains(., 'This')]")
    end
  end

  def self.expect_size_conversion_modal_content
    p "Expecting size conversion modal"
    size_conversion_prefix = PRODUCT_PAGE_PREFIX + "size_conversion_iframe:"
    page.within_frame(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "size_conversion_iframe",
                                   "//iframe[@title='Size Guide']")) do
      tabs_text = rev_get_pdp_content['size_and_fit_modal']['size_conversion_modal']['tabs_text']
      tabs_text.each do |name, text|
        p text
        page.assert_selector(:xpath, "//ul[contains(@class, 'size')]//li//*[text()='#{text}']")
        p "I see #{name} tab on size modal"
      end
      fixed_table_locator = "//div[@class='pinned']//table"
      fixed_table_ta_locator = size_conversion_prefix + "fixed_table"
      page.assert_selector(:xpath, m_ta(fixed_table_ta_locator, fixed_table_locator))
      fixed_table_text = find(:xpath, m_ta(fixed_table_ta_locator, fixed_table_locator)).text
      expect(fixed_table_text.length).to be > 50
      scrollable_table_locator = "//div[@class='scrollable']//table"
      scrollable_table_ta_locator = size_conversion_prefix + "scrollable_table"
      page.assert_selector(:xpath, m_ta(scrollable_table_ta_locator,
                                        scrollable_table_locator))
      scrollable_table_text = find(:xpath, m_ta(scrollable_table_ta_locator,
                                                scrollable_table_locator)).text
      expect(scrollable_table_text.length).to be > 50
    end
    p "Size modal has expected content"
  end

  def self.expect_similar_items_content
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "similar_items_logo",
                                      "//*[contains(text(), 'Similar ')]"))
    similar_items_locators = rev_get_pdp_content['similar_items_multiple_locators']
    items_count = find_all(:xpath, similar_items_locators['similar_items_names']).count
    expect(items_count).to be >= 1
    (1..items_count).each do |item_number|
      similar_items_locators.each do |name, locator|
        item_locator = m_ta(PRODUCT_PAGE_PREFIX + name + item_number.to_s, locator + "[#{item_number}]")
        VN_AllPage.scroll_to_element(item_locator)
        page.assert_selector(:xpath, item_locator)
        p "I see #{name} on #{item_number} item"
      end
    end
  end

  def self.expect_ratings_and_reviews_content
    locators = rev_get_pdp_content['ratings_and_reviews_locators']
    locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + name, locator))
      p "I see #{name} on rating and reviews section"
    end
    stars_locator = "//*[contains(text(),'Ratings & Reviews')]//following-sibling::div//*[@focusable='false' and @aria-hidden='true']"
    stars_count = find_all(:xpath, stars_locator).count
    expect(stars_count).to eq 5
    expect_correct_main_size_review
  end

  def self.expect_correct_main_size_review
    locators = rev_get_pdp_content['ratings_and_reviews_locators']
    rating = {}
    rating['runs small'] = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "runs_small_value",
                                             locators['runs_small_value'])).text.to_i
    rating['true to size'] = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "true_to_size_value",
                                               locators['true_to_size_value'])).text.to_i
    rating['runs large'] = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "runs_large_value",
                                             locators['runs_large_value'])).text.to_i
    p rating
    max_pair = rating.max_by {|k, v| v}
    p main_text = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "size_rating_main_text",
                                    locators['size_rating_main_text'])).text
    p main_value = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "size_rating_main_value",
                                     locators['size_rating_main_value'])).text.to_i
    expect(max_pair[0].downcase).to eq main_text.downcase
    expect(max_pair[1]).to eq main_value
  end

  def self.expect_complete_the_look_section
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "ctl_text",
                                      "//*[contains(text(), 'Complete The Look')]"))
    items_locators = rev_get_pdp_content['complete_the_look_multiple_locators']
    items_count = find_all(:xpath, items_locators['item_names']).count
    expect(items_count).to be > 1
    (1..items_count).each do |item_number|
      items_locators.each do |name, locator|
        item_locator = m_ta(PRODUCT_PAGE_PREFIX + name + item_number.to_s, locator + "[#{item_number}]")
        VN_AllPage.scroll_to_element(item_locator)
        page.assert_selector(:xpath, item_locator)
        p "I see #{name} on complete the look item #{item_number}"
      end
    end
  end

  def self.expect_preorder_message
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "preorder_main",
                                      "//*[contains(text(), 'Preorder')]"))
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "preorder_text",
                                      "//*[contains(text(), 'Your preorder')]"))
  end

  def self.remember_item_element(element_name)
    p "Remembering #{element_name} "
    locators = rev_get_pdp_content['base_pdp_locators']
    locator = locators[element_name.sub('product_', '')]
    if $revolve_stored_information.key?(element_name)
      $revolve_stored_information[element_name].push(find(:xpath, locator).text)
    else
      $revolve_stored_information[element_name] = []
      $revolve_stored_information[element_name].push(find(:xpath, locator).text)
    end
  end

  def self.expect_shipping_content
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "us_shipping",
                                      "//*[text()='US Shipping']"))
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "free_days",
                                      "//*[contains(text(), 'Free 2 day')]"))
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "worldwide_shipping",
                                      "//*[text()='Worldwide Shipping']"))
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "free_worldwide_shipping",
                                      "//*[contains(text(), 'Free worldwide shipping')]"))
    shipping_info_link_locator = rev_get_pdp_content['optional_locators']['view_full_shipping_details']
    page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "view_full_shipping_details",
                                      shipping_info_link_locator))
    p "Shipping content is correct"
  end

  def self.expect_recently_viewed_content
    header_locator = rev_get_home_page_content['recently_viewed_locators']['recently_viewed_header']
    page.assert_selector(:xpath, header_locator)
    p rv_items_locators = rev_get_pdp_content['multiple_locators']['recently_viewed_multiple_locators']
    rv_items_count = find_all(:xpath, rv_items_locators['recently_viewed_products_names'], visible: true).count
    p "Recently viewed items count: #{rv_items_count}"
    expect(rv_items_count).to be >= 1
    (1..rv_items_count).each do |item_number|
      rv_items_locators.each do |name, locator|
        ta_locator = PRODUCT_PAGE_PREFIX + "recently_viewed_items:" + name + item_number.to_s
        scroll_to_element(m_ta(ta_locator, locator + "[#{item_number}]"))
        page.assert_selector(:xpath, m_ta(ta_locator,
                                          locator + "[#{item_number}]"), visible: true)
        p "I see #{name} on #{item_number} recently viewed item"
      end
    end
  end

  def self.expect_no_content(content_name)
    locator = rev_get_pdp_content['optional_locators'][content_name]
    if locator.nil?
      raise StandardError.new 'No such content on product page'
    end
    page.assert_no_selector(:xpath, locator)
    p "I can not see #{content_name} on product_page"
  end

end