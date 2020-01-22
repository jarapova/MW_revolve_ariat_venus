# In this module we collect methods for the category page of ANNIE SELKE
require 'capybara/cucumber'


module AN_CategoryPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.select_random_filter_subcategory
    category_name = find(:xpath, "(//div[@data-page='Category']//div/h5)").text
    p  "I see #{category_name} category page"
    click_random_subcategory_on_category_page
  end

  def self.select_subcategory_from_filter(arg)
    expect(page).to have_selector(:xpath, "(//div[@data-page='Category']//div[text()='#{arg}'])")
    category_name = find(:xpath, "(//div[@data-page='Category']//div[text()='#{arg}'])").text
    category_name = category_name.downcase.capitalize
    p  "I am clicking on the #{category_name} subcategory link"
    find(:xpath, "(//div[@data-page='Category']//div[text()='#{arg}'])").click
    expect(page).to have_selector(:xpath, "//div[@data-page='Subcategory']//span[text()='#{category_name}']")
    p  "I am on the #{category_name} subcategory page"
  end

  def self.open_size_filter
    expect(page).to have_selector(:xpath, "//span[text()='+ Filter']/ancestor-or-self::button")
    find(:xpath,"//span[text()='+ Filter']/ancestor-or-self::button").click
    p  "I opened the filter"
    sleep(1)
  end

  def self.select_random_size_filter_option
    expect(page).to have_selector(:xpath, "//h6[normalize-space(text())]")
    filter_tab_count_on_page = find_all(:xpath, "//h6[normalize-space(text())]").count
    random_filter_tab = Random.rand(1..filter_tab_count_on_page)
    random_filter_tab_name = find(:xpath, "(//h6[normalize-space(text())])[#{random_filter_tab}]", visible: :all).text
    find(:xpath, "(//h6[normalize-space(text())])[#{random_filter_tab}]").click
    p  "Filter tab #{random_filter_tab_name} was chosen"
    expect(page).to have_selector(:xpath, "//div[contains(@style, 'height: auto;')]//label")
    sleep 1
    filter_option_count_on_page = find_all(:xpath, "//div[contains(@style, 'height: auto')]//label").count
    random_filter_option = Random.rand(1..filter_option_count_on_page)
    random_filter_option_name = find(:xpath, "//div[contains(@style, 'height: auto;')]//label[#{random_filter_option}]").text
    random_filter_option_name = random_filter_option_name.capitalize.gsub("\n"," ")
    find(:xpath, "(//div[contains(@style, 'height: auto')]//label)[#{random_filter_option}]", visible: :all).click
    p  "Filter option '#{random_filter_option_name}' was chosen"
    find(:xpath, "(//h6[normalize-space(text())])[#{random_filter_tab}]").click
    # Closes filter tab; important for the two-filter test
  end

  def self.expect_items_list_with_applied_filter
    sleep 3
    $item_count_on_page_with_filter_applied = find(:xpath, "//div[@data-page='Subcategory']/div/div/span").text.gsub(" total items","").to_i
    # This gathers the updated text, "x total items", strips the alphabetic characters, and converts the remaining number to an integer
    p  "Current number of items listed: #{$item_count_on_page_with_filter_applied}"
    sleep 1
  end

  def self.clear_all_filters
    sleep 3
    expect(page).to have_selector(:xpath, "//div/a[.='clear all']")
    find(:xpath, "//div/a[.='clear all']").click
    p  "I cleared the filter selections"
    sleep 2
  end

  def self.expect_items_in_list
    sleep 3
    expect(page).to have_selector(:xpath, "//div[@data-page='Subcategory']/div/div/span")
    $item_count_on_page = find(:xpath, "//div[@data-page='Subcategory']/div/div/span").text.gsub(" total items","").to_i
    # This gathers all the text within the "x total items" string, trims the text, and leaves the numbers as an integer
    p  "Current number of items listed: #{$item_count_on_page}"
    sleep 2
  end

  def self.compare_item_count_should_be_less
    expect($item_count_on_page_with_filter_applied).to be <= $item_count_on_page
    p "After the filter has been applied, items count changes from #{$item_count_on_page} to #{$item_count_on_page_with_filter_applied}, as expected"
  end

  def self.compare_item_count_should_be_more
    sleep 3
    $item_count_on_page = find(:xpath, "//div[@data-page='Subcategory']/div/div/span").text.gsub(" total items","").to_i
    expect($item_count_on_page).to be >= $item_count_on_page_with_filter_applied
    # Checks that the total item count has either dropped or on par with the previous filtered amount
    p  "Without a filter applied, the items count has changed from #{$item_count_on_page_with_filter_applied} to #{$item_count_on_page}, as expected"
  end

  def self.select_two_random_size_filter
    expect(page).to have_selector(:xpath, "//h6[normalize-space(text())]")
    filter_tab_count_on_page = find_all(:xpath, "//h6[normalize-space(text())]").count
    half_of_filter_tab_count_on_page = filter_tab_count_on_page/2
    first_random_filter_tab_count = Random.rand(1...half_of_filter_tab_count_on_page)
    second_random_filter_tab_count = Random.rand(half_of_filter_tab_count_on_page..filter_tab_count_on_page)

    find(:xpath, "(//h6[normalize-space(text())])[#{first_random_filter_tab_count}]").click
    # Opens the first tab
    sleep 1
    first_filter_option_count_on_page = find_all(:xpath, "//div[contains(@style, 'height: auto')]//label").count
    first_random_filter_option = Random.rand(1..first_filter_option_count_on_page)
    first_random_filter_option_name = find(:xpath, "//div[contains(@style, 'height: auto;')]//label[#{first_random_filter_option}]", visible: :all).text.capitalize.gsub("\n"," ")
    find(:xpath, "(//div[contains(@style, 'height: auto')]//label)[#{first_random_filter_option}]", visible: :all).click
    find(:xpath, "(//h6[normalize-space(text())])[#{first_random_filter_tab_count}]").click
    sleep 1
    # Closes the first tab

    find(:xpath, "(//h6[normalize-space(text())])[#{second_random_filter_tab_count}]").click
    # Opens the second tab
    sleep 1
    second_filter_option_count_on_page = find_all(:xpath, "//div[contains(@style, 'height: auto')]//label").count
    second_random_filter_option = Random.rand(1..second_filter_option_count_on_page)
    second_random_filter_option_name = find(:xpath, "//div[contains(@style, 'height: auto;')]//label[#{second_random_filter_option}]", visible: :all).text.capitalize.gsub("\n"," ")
    find(:xpath, "(//div[contains(@style, 'height: auto')]//label)[#{second_random_filter_option}]", visible: :all).click
    find(:xpath, "(//h6[normalize-space(text())])[#{second_random_filter_tab_count}]").click
    p  "#{first_random_filter_option_name} and #{second_random_filter_option_name} filter options were chosen"
    sleep 1
  end

  def self.view_results_click
    find(:xpath, '//button[contains(.,"View Results")]').click
    p  "I pressed the View Results button"
  end


  def self.select_random_item_from_category
    page.assert_selector(:xpath, "//li//img")
    item_count_on_page = find_all(:xpath, "//li//img").count
    if item_count_on_page == 1
      random_item_index = 1
    else
      random_item_index = Random.rand(1...item_count_on_page)
    end
    item_name,  item_price,  item_price_discount = an_get_item_parameters_on_category_page(random_item_index)
    p  "I see #{item_name} with price #{item_price}."
    find(:xpath, "//li[#{random_item_index}]//img").click
    p  "I've clicked on the #{item_name} image"
    expect(page).to have_text(item_price)
    p  "Price is correct on PDP page"
    p  "I am on the #{item_name} PDP page"
    return item_name, item_price, item_price_discount
  end

  def self.expect_subcategory_page_for(arg)
    arg = arg.upcase
    page.assert_selector(:xpath, "(//div[@data-page='Subcategory']//span[text()=..])[1]")
    p  "I appear on subcategory #{arg} page"
    p  find(:xpath, "(//div[@data-page='Subcategory']//span[text()=..])[1]").text == arg
  end

  def self.random_gallery_category
    gallery_count = find_all(:xpath, "//div[@class='content-article-page']/div/a").count
    # We need to subtract 1 from this count, because the last gallery is just a link to the "All Catalogs" page, different than the other links
    gallery_count = gallery_count - 1
    p  "There are #{gallery_count} galleries listed on this page. They are listed as follows:"
    # The counter starts at 2 instead of 1, because the first hero image isn't a link, it's simply a banner for the current page
    for i in 2..gallery_count
      p  find(:xpath, "//div[@class='content-article-page']/div[#{i}]/a").text.tr("\n", ": ")
    end
    random_gallery_num = Random.rand(2..gallery_count)
    random_gallery_num_adjusted = random_gallery_num - 1
    random_gallery = find(:xpath, "//div[@class='content-article-page']/div[#{random_gallery_num}]/a/p[@class='herosliceHeader']")
    random_gallery_selected = random_gallery.text
    p  "Randomly selected #{random_gallery_selected}, the number #{random_gallery_num_adjusted} gallery"
    random_gallery.click
    sleep(3)
  end

  def self.random_gallery_subcategory
    gallery_count = find_all(:xpath, "//table//td").count
    p  "There are #{gallery_count} subcategories listed on this gallery page. They are listed as follows:"
    for i in 1..gallery_count
      p  find(:xpath, "(//td/a/span)[#{i}]").text.tr("\n", ": ")
    end
    random_gallery_num = Random.rand(1..gallery_count)
    random_gallery = find(:xpath, "(//td/a/span)[#{random_gallery_num}]")
    random_gallery_selected = random_gallery.text
    p  "Randomly selected #{random_gallery_selected}, the number #{random_gallery_num} subcategory"
    random_gallery.click
  end

  def self.user_is_on_category_page
    assert_selector(:xpath, "(//div[@data-page='Subcategory']//span[text()=..])[1]")
    category_page_name = find(:xpath, "(//div[@data-page='Subcategory']//span[text()=..])[1]").text
    p  "I'm on #{category_page_name} category page"
  end

  def self.click_random_subcategory_on_category_page
    subcategories_count = find_all(:xpath, "//li").count
    p  "I see #{subcategories_count} subcategories in filter"
    random_subcategory_index = Random.rand(1...subcategories_count)
    subcategory_name = find(:xpath, "//li[#{random_subcategory_index}]//div[normalize-space(text())]").text
    find(:xpath, "//li[#{random_subcategory_index}]//div[normalize-space(text())]").click
    p  "I've clicked #{subcategory_name} item from subcategory navigation filter"
  end

end

