# In this module we collecting methods for category page of VN
require 'capybara/cucumber'


module VN_CategoryPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.expect_content(content_name_to_check)
    if content_name_to_check.include? "_category_dropdown"
      category_name = content_name_to_check.gsub("_category_dropdown","")
      dropdown_text = vn_get_category_dropdown_text(category_name)
      locator = '//input[@name="subcategories"]/preceding-sibling::div[text()="'+dropdown_text+'"]'
      page.assert_selector(:xpath, locator)
      p  "I see #{content_name_to_check} on category page"
    elsif content_name_to_check.include? "shop_now_buttons"
      shop_now_buttons_locator = "(//div[@data-page='Category']//a[@title='Shop Now' and text()])"
      shop_now_buttons_count = find_all(:xpath, shop_now_buttons_locator).count
      expect(shop_now_buttons_count).to be >= 1
      p "Shop now buttons"
      (1..shop_now_buttons_count).each do |button_number|
        p find(:xpath, shop_now_buttons_locator+"[#{button_number}]").text
      end
    elsif content_name_to_check.include? "category_banners"
      category_banners_locator = "//div[@data-page='Category']//img[@src]"
      category_banners_count = find_all(:xpath, category_banners_locator).count
      expect(category_banners_count).to be >= 1
      p "I see #{category_banners_count} banners on category page"
    elsif content_name_to_check == 'style_categories_content'
      expect_style_categories_content
    end
  end


  def self.select_random_filter_subcategory
    category_name = find(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div").text
    p"I see #{category_name} navigation filter"
    find(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div").click
    p"I've clicked on #{category_name} navigation filter"
    page.assert_selector(:xpath, "//ul[@role='listbox']")
    VN_CategoryPage.click_random_subcategory_from_filter
  end

  def self.click_random_subcategory_from_filter
    page.assert_selector(:xpath, "//ul[@role='listbox']")
    subcategories_count = find_all(:xpath, "//ul[@role='listbox']/li").count
    subcategories_count = subcategories_count-2 #removing SALE and CLEARANCE as it is not subcategories
    p  "I see #{subcategories_count} subcategories in filter"
    random_subcategory_index = Random.rand(1...subcategories_count)
    subcategory_name = find(:xpath, "//ul[@role='listbox']/li[#{random_subcategory_index}]").text
    find(:xpath, "//ul[@role='listbox']/li[#{random_subcategory_index}]").click
    p"I've clicked #{subcategory_name} item from subcategory navigation filter"
  end

  def self.expect_category_page_for(arg)
    page.assert_selector(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div")
    filter_text = find(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div").text
    expect(arg.upcase).to eq(filter_text)
    p  "I appear on #{filter_text} page"
  end

  def self.click_random_product(element_name)
    if element_name == 'random_style_category'
      multiple_locator = vn_get_specific_pages['shop_by_style_multiple_locators']['category_images']
      p "I clicked " + click_random_element(multiple_locator).to_s
    else
      product_count = find_all(:xpath, "//div[contains(@id, 'item')]").count
      product_number = Random.rand(product_count)
      p "clicked product number #{product_number}"
      find(:xpath, "//div[@id='item-#{product_number}']").click
    end
  end

  def self.select_subcategory_from_filter(arg)
    filter_locator = "(//input[@name='subcategories'])/preceding-sibling::div"
    page.assert_selector(:xpath, filter_locator)
    category_name = find(:xpath, filter_locator).text
    category_name = category_name.downcase.capitalize
    p"I see #{category_name} navigation filter"
    find(:xpath, filter_locator).click
    page.assert_selector(:xpath, "//ul[@role='listbox']")
    sleep 1
    find(:xpath, "//ul[@role='listbox']/li[text()='#{arg}']").click
    # find(:xpath, "//ul[@role='listbox']/li[text()='Dresses']").click
    if category_name.include? "Sale"
      page.assert_selector(:xpath, "//div[@data-page='Subcategory']//h1[contains(text(), 'sale')]")
    else
      page.assert_selector(:xpath, "//div[@data-page='Subcategory']//h1[text()='#{category_name}']")
    end
    end

  def self.click_subcategory_from_filter(subcategory_name)
    if subcategory_name.include? "random"
      subcategory_count = find_all(:xpath, "//ul[@role='listbox']//li").count
      #Random starts from 2 because li is a main category name
      random_parameter = Random.rand(2..subcategory_count)
      p find(:xpath, "//ul[@role='listbox']//li[#{random_parameter}]").text
      find(:xpath, "//ul[@role='listbox']//li[#{random_parameter}]").click
    elsif
      find(:xpath, "//ul[@role='listbox']//li[contains(.,'#{subcategory_name}')]").click
    end
  end

  def self.click_category_filter
    sleep 1
    locator = "(//*[@id='select-subcategories'])[1]"
    page.assert_selector(:xpath, locator)
    find(:xpath, locator).click
    sleep 2
    p "I clicked category filter"
  end

  def self.click_shop_by_color(element_name, sleep_after = 3)
    if element_name.include? 'accordion'
      accordion_locator = get_shop_by_color_accordion_locator(element_name.sub('_accordion',''))
      find(:xpath, accordion_locator).click
      p "I clicked #{element_name} on shop by color page"
    elsif element_name == 'random_color_link'
      colors_locator = vn_get_specific_pages['shop_by_color_multiple_locators']['color_links']
      p "I clicked color " + click_random_element(colors_locator).to_s
    else
      locator = vn_get_specific_pages['shop_by_color_locators'][element_name]
      find(:xpath, locator).click
      sleep sleep_after
      p "I clicked #{element_name}"
    end
  end

  def self.get_shop_by_color_accordion_locator(accordion_text)
    "//*[@aria-expanded]//descendant-or-self::*[contains(text(), '#{accordion_text}')]"
  end

  def self.expect_style_categories_content
    locators = vn_get_specific_pages['shop_by_style_multiple_locators']
    categories_count = find_all(:xpath, locators['category_images']).count
    expect(categories_count).to be > 0
    (1..categories_count).each do |i|
      locators.each do |name, locator|
        page.assert_selector(:xpath, locator + "[#{i}]")
        p "I see #{i} #{name} on shop_by_style_page"
      end
    end
    page.assert_selector(:xpath, "//*[@id='select-subcategories']")
    p "I see subcategory filter"
  end

end



