# In this module we collecting methods for Home page of REVOLVE
require 'capybara/cucumber'


module REV_HomePage
  extend Capybara::DSL
  extend RSpec::Matchers

  HOME_PAGE_PREFIX = "revolve:home_page:"

  def self.visit_home_page
    visit BASE_URL
    sleep 1
    p  "I am on #{BASE_URL} home page"
  end

  def self.expect_content(content_name)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name == 'home_page_content'
      expect_home_page_content
    elsif content_name == 'recently_viewed_content'
      expect_recently_viewed_content
    elsif content_name == 'banners_content'
      expect_slide_banners_content
    elsif content_name == 'mens_home_page_content'
      expect_mens_home_page_content
    elsif content_name == 'hot_list_content'
      expect_hot_list_content
    elsif content_name == 'navigation_categories'
      expect_category_navigation_panel
    elsif content_name == 'banners_categories_content'
      expect_banners_categories
    elsif content_name == 'email_discount_banner'
      email_banner_locator = rev_get_home_page_content['email_subscription']['home_page_locator'][content_name]
      page.assert_selector(:xpath, m_ta(HOME_PAGE_PREFIX + content_name, email_banner_locator))
      p "I see email_discount_banner"
    elsif content_name == 'email_discount_banner_content'
      expect_discount_banner_content
    elsif content_name == 'email_offer_code_content'
      expect_offer_code_content
    elsif content_name == 'product_recommendations_content'
      expect_product_recommendations
    elsif content_name == 'best_sellers_content'
      expect_best_sellers_content
    else
      page.assert_selector(:xpath, "//*[contains(text(), '#{content_name}')]")
    end
  end

  def self.expect_best_sellers_content
    items_locators = rev_get_home_page_content['best_sellers_multiple_locators']
    best_sellers_count = find_all(:xpath, items_locators['best_sellers_names']).count
    expect(best_sellers_count).to be > 0
    (1..best_sellers_count).each do |item_number|
      items_locators.each do |name, locator|
        item_locator = locator + "[#{item_number}]"
        VN_AllPage.scroll_to_element(item_locator)
        page.assert_selector(:xpath, item_locator)
        p "I see #{name} on best seller item #{item_number}"
      end
    end
  end

  def self.expect_home_page_content
    rev_get_home_page_content['base_locators'].each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name}"
    end
    slide_dot_buttons_locator = rev_get_home_page_content['multiple_locators']['slide_dot_buttons']
    slide_dot_buttons_count = find_all(:xpath, slide_dot_buttons_locator).count
    expect(slide_dot_buttons_count).to be >= 2
    p "I see slide dot buttons #{slide_dot_buttons_count}"
    hot_images_locator = rev_get_home_page_content['multiple_locators']['hot_list_images']
    hot_images_count = find_all(:xpath, hot_images_locator).count
    expect(hot_images_count).to be >= 1
    p "I see hot_images #{hot_images_count}"
    expect_category_navigation_panel
  end

  def self.expect_product_recommendations
    product_rec_names_locator = rev_get_home_page_content['multiple_locators']['product_recommendations_names']
    p pro_rec_count = find_all(:xpath, product_rec_names_locator).count
    expect(pro_rec_count).to be >= 1
    locators = {}
    locators['product_recommendations_names'] = product_rec_names_locator
    locators['product_recommendations_images'] = rev_get_home_page_content['multiple_locators']['product_recommendations_images']
    locators['product_recommendations_prices'] = rev_get_home_page_content['multiple_locators']['product_recommendations_prices']
    (1..pro_rec_count).each do |product_number|
      locators.each do |name, locator|
        product_locator = locator + "[#{product_number}]"
        ta_locator = HOME_PAGE_PREFIX + name + product_number.to_s
        scroll_to_element(m_ta(ta_locator, product_locator), 0.2)
        page.assert_selector(:xpath, m_ta(ta_locator, product_locator))
        p "I see #{name} on item #{product_number}"
      end
    end
  end

  def self.expect_recently_viewed_content(multiplier = 0)
    header_locator = rev_get_home_page_content['recently_viewed_locators']['recently_viewed_header']
    page.assert_selector(:xpath, header_locator)
    sleep 1.5
    rv_items_locator = rev_get_home_page_content['recently_viewed_multiple_locators']['recently_viewed_products_names']
    rv_items_count = find_all(:xpath, rv_items_locator, visible: true).count
    p rv_items_count
    expect(rv_items_count).to be >= 1
    (1..rv_items_count).each do |item_number|
      rev_get_home_page_content['recently_viewed_multiple_locators'].each do |name, locator|
        ta_locator = HOME_PAGE_PREFIX +
            "recently_viewed_items:" +
            name + (item_number + (multiplier * rv_items_count)).to_s
        scroll_to_element(m_ta(ta_locator, locator + "[#{item_number + (multiplier * rv_items_count)}]"), 0.2)
        page.assert_selector(:xpath, m_ta(ta_locator,
                                          locator + "[#{item_number + (multiplier * rv_items_count)}]"), visible: true)
        p "I see #{name} on #{item_number} recently viewed item"
      end
    end
  end

  def self.click_element(element_name)
    if element_name == 'random_hot_list_image'
      VN_AllPage.scroll_to_bottom
      hot_list_images_locator = rev_get_home_page_content['multiple_locators']['hot_list_images']
      p images_count = find_all(:xpath, hot_list_images_locator).count
      random_number = Random.rand(1..images_count)
      click_hot_list_image(random_number)
    elsif element_name == 'random_recommended_product'
      rec_prod_locator = rev_get_home_page_content['multiple_locators']['product_recommendations_names']
      rec_prod_count = find_all(:xpath, rec_prod_locator).count
      random_number = Random.rand(1..rec_prod_count)
      click_recommended_product(random_number)
    elsif element_name == 'random_best_sellers_product'
      bs_prod_locator = rev_get_home_page_content['best_sellers_multiple_locators']['best_sellers_names']
      bs_prod_count = find_all(:xpath, bs_prod_locator).count
      random_number = Random.rand(1..bs_prod_count)
      click_best_seller_product(random_number)
    elsif element_name == 'random_recently_viewed_item'
      rv_items_locator = rev_get_home_page_content['recently_viewed_multiple_locators']['recently_viewed_products_images']
      rv_items_count = find_all(:xpath, rv_items_locator).count
      random_number = Random.rand(1..rv_items_count)
      click_recently_viewed_product(random_number)
    elsif element_name.include? 'slide_banner'
      element_number = element_name.sub("_slide_banner", "").to_i
      click_slide_banner(element_number)
    elsif element_name == 'view_hot_list_button'
      button_locator = rev_get_home_page_content['base_locators']['hot_list_shop_now_button']
      find(:xpath, m_ta(HOME_PAGE_PREFIX + "hot_list_shop_now_button", button_locator)).click
    else
      locators = rev_get_home_page_content['email_subscription']['home_page_locator']
      find(:xpath, m_ta(HOME_PAGE_PREFIX + element_name, locators[element_name])).click
      p "I clicked #{element_name}"
    end
  end

  def self.click_slide_banner(banner_number)
    slide_buttons_locator = rev_get_home_page_content['multiple_locators']['slide_dot_buttons']
    slide_images_locator = rev_get_home_page_content['multiple_locators']['slide_images']
    find(:xpath, m_ta(HOME_PAGE_PREFIX + "slide_dot_buttons" + banner_number.to_s,
                      slide_buttons_locator + "[#{banner_number}]")).click
    find(:xpath, m_ta(HOME_PAGE_PREFIX + "slide_images" + banner_number.to_s,
                      slide_images_locator + "[#{banner_number}]")).click
    p "Selected and clicked #{banner_number} slide_banner"
  end

  def self.click_hot_list_image(image_number)
    hot_list_images_locator = rev_get_home_page_content['multiple_locators']['hot_list_images']
    hot_list_image_locator = hot_list_images_locator + "[#{image_number}]"
    VN_AllPage.scroll_to_element(hot_list_image_locator)
    find(:xpath, hot_list_image_locator).click
    p"Clicked #{image_number} hot list item"
  end

  def self.click_recommended_product(product_number)
    rec_products_locator = rev_get_home_page_content['multiple_locators']['product_recommendations_names']
    rec_product_locator = rec_products_locator + "[#{product_number}]"
    VN_AllPage.scroll_to_element(rec_product_locator)
    find(:xpath, rec_product_locator).click
  end

  def self.click_best_seller_product(product_number)
    bs_products_locator = rev_get_home_page_content['best_sellers_multiple_locators']['best_sellers_names']
    bs_product_locator = bs_products_locator + "[#{product_number}]"
    VN_AllPage.scroll_to_element(bs_product_locator)
    find(:xpath, bs_product_locator).click
  end

  def self.click_recently_viewed_product(product_number)
    rv_items_locator = rev_get_home_page_content['recently_viewed_multiple_locators']['recently_viewed_products_images']
    find(:xpath, m_ta(HOME_PAGE_PREFIX + "recently_viewed_item" + product_number.to_s,
                      rv_items_locator + "[#{product_number}]")).click
  end

  def self.expect_slide_banners_content
    slide_dot_buttons_locator = rev_get_home_page_content['multiple_locators']['slide_dot_buttons']
    selected_hero_image = rev_get_home_page_content['base_locators']['selected_slide_image']
    slide_dot_buttons_count = find_all(:xpath, slide_dot_buttons_locator).count
    (2..slide_dot_buttons_count).each do |button_number|
      find(:xpath, m_ta(HOME_PAGE_PREFIX + "slide_dot_buttons" + button_number.to_s,
                        slide_dot_buttons_locator + "[#{button_number}]")).click
      REV_ProductListingPage.wait_placeholders
      page.assert_selector(:xpath, m_ta(HOME_PAGE_PREFIX + "slide_banner" + button_number.to_s,
                                        selected_hero_image))
      sleep 0.4
    end
  end

  def self.expect_mens_home_page_content
    p "Expecting mens homepage content"
    pr_header_locator = rev_get_home_page_content['base_locators']['product_recomendations_header']
    page.assert_selector(:xpath, pr_header_locator)
    self.expect_best_sellers_content
  end

  def self.expect_hot_list_content
    hot_list_locators = rev_get_home_page_content['hot_list_locators']
    hot_list_locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(HOME_PAGE_PREFIX + name, locator))
      p "I see #{name}"
    end
    REV_AccountPage.expect_help_us_improve_frame_content
    items_locator = rev_get_home_page_content['multiple_locators']['hot_list_looks']
    items_text_locators = rev_get_home_page_content['multiple_locators']['hot_list_looks_texts']
    items_images_locator = rev_get_home_page_content['multiple_locators']['hot_list_looks_images']
    items_count = find_all(:xpath, items_locator).count
    expect(items_count).to be >= 1
    (1..items_count).each do |item_number|
      page.assert_selector(:xpath, m_ta(HOME_PAGE_PREFIX + "hot_list_item_text_" + item_number.to_s,
                                        items_text_locators + "[#{item_number}]"))
      page.assert_selector(:xpath, m_ta(HOME_PAGE_PREFIX + "hot_list_item_image_" + item_number.to_s,
                                        items_images_locator + "[#{item_number}]"))
      p "I see #{item_number} hot list item parameters"
    end
  end

  def self.expect_recently_viewed_parameters(item_name)

    def self.expect_text_in_items(locator, text)
      p text.downcase!
      items_parameters = []
      find_all(:xpath, locator).each do |element|
        items_parameters.push(element.text.downcase)
        p element.text.downcase
      end
      p items_parameters
      expect(items_parameters).to include text
    end

    item_parameters = $revolve_stored_information[item_name]
    p "parameters: #{item_parameters}"

    rv_locators = rev_get_home_page_content['recently_viewed_multiple_locators']
    expect_text_in_items(rv_locators['recently_viewed_products_names'], item_parameters[0])
    expect_text_in_items(rv_locators['recently_viewed_products_prices'], item_parameters[1])
  end

  def self.expect_category_navigation_panel
    categories = rev_get_home_page_content['categoy_navigation_panel_text']
    categories.each do |name, text|
      page.assert_selector(:xpath, m_ta(HOME_PAGE_PREFIX + "nav:" + name, get_category_locator(text)))
      p "I see #{name} navigation category on home_page"
    end
  end

  def self.get_category_locator(category_name)
    "//nav//*[text()='#{category_name}']"
  end

  def self.click_navigation_panel_category(category_name)
    # REV_AllPage.scroll_to_bottom
    sleep 2
    page.execute_script("window.scrollTo(0, 40);")
    ta_locator_name = category_name.sub(" & ", "").sub(" ", "")
    find(:xpath, m_ta(HOME_PAGE_PREFIX + ta_locator_name, get_category_locator(category_name))).click
    p "I clicked #{category_name} on category_panel"
  end

  def self.expect_banners_categories
    slide_dot_buttons_locator = rev_get_home_page_content['multiple_locators']['slide_dot_buttons']
    active_slide_image = rev_get_home_page_content['base_locators']['selected_slide_image']
    slide_dot_buttons_count = find_all(:xpath, slide_dot_buttons_locator).count
    (1..slide_dot_buttons_count).each do |button_number|
      REV_AllPage.remember_current_url
      sleep 2
      find(:xpath, m_ta(HOME_PAGE_PREFIX + "slide_dot_buttons" + button_number.to_s,
                        slide_dot_buttons_locator + "[#{button_number}]")).click
      p "Slide button #{button_number} clicked"
      sleep 3
      find(:xpath, m_ta(HOME_PAGE_PREFIX + "slide_banner" + button_number.to_s,
                        active_slide_image)).click
      p "Clicked on #{button_number} Banner"
      p "Expecting banner content"
      VN_AllPage.update_page
      if page.has_selector?(:xpath, "//noscript[contains(text(), 'You need to enable')]", visible: :all)
        REV_ProductListingPage.expect_min_product_list_page_content
      else
        p "Expecting non-pwa page content"
        p img_count = find_all(:xpath, '//img').count
        expect(img_count).to be > 2
        p "I see non-pwa page images"
        p "Expecting same environment"
        REV_AllPage.expect_content('page_url')
      end
      REV_HeaderPage.click_element("logo_button")
    end
  end

  def self.expect_discount_banner_content
    locators = rev_get_home_page_content['email_subscription']['subscription_pop_up_locators']
    ta_locator_prefix = HOME_PAGE_PREFIX + "email_subscription_pop_up:"
    locators.each do |name, locator|
      p "#{name} #{locator}"
      page.assert_selector(:xpath, m_ta(ta_locator_prefix + name, locator))
      p "I see #{name} on sign_in_pop_up"
    end
  end

  def self.make_email_subscription
    locators = rev_get_home_page_content['email_subscription']['subscription_pop_up_locators']
    ta_locator_prefix = HOME_PAGE_PREFIX + "email_subscription_pop_up:"
    find(:xpath, m_ta(ta_locator_prefix + "email_field", locators['email_field'])).set(generate_email)
    find(:xpath, m_ta(ta_locator_prefix + 'sign_up_button', locators['sign_up_button'])).click
  end

  def self.expect_offer_code_content
    locators = rev_get_home_page_content['email_subscription']['successful_offer_code_locators']
    ta_locator_prefix = HOME_PAGE_PREFIX + "email_subscription_pop_up:"
    locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(ta_locator_prefix + name,locator))
      p "I see #{name} on email_pop_up"
    end
  end

  def self.expect_no_content(content_name)
    if content_name == 'product_recommendations_content'
      page.assert_no_selector(:xpath, "//*[contains(text(), 'Recommend')]")
      p "I can't see Recommended for You header"
    end
  end

end