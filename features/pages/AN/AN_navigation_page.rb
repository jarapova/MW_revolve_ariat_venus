# In this module we collect methods for the navigation page of ANNIE SELKE
require 'capybara/cucumber'


module AN_NavigationPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.navigate_to_category_from_carousel(category)
    expect(page).to have_selector(:xpath, '//*[@role="tablist"]//div[contains(.,"'+category+'")]')
    p  "I see #{category} in the main navigation carousel, and am clicking on the link now"
    find(:xpath, '//*[@role="tablist"]//button[contains(.,"'+category+'")]').click
    category_string = category.to_s.upcase
    find(:xpath, "//h5[contains(.,#{category_string})]")
    p  "I appear to be on the #{category} category page"
  end

  def self.go_back_browser
    page.go_back
    p  "Navigating back to the Home Page"
  end

  def self.go_back_breadcrumb_PDP
    sleep 1
    breadcrumbs = an_get_breadcrumbs
    p  "I see breadcrumbs #{breadcrumbs}"
    find(:xpath, "//span[contains(.,'#{breadcrumbs[-2]}')]/a").click
    p "I've clicked on breadcrumb #{breadcrumbs[-2]} "
  end

  def self.go_to_category(arg)
    expect(page).to have_selector(:xpath, '//div[contains(.,"'+arg+'")]')
    p  "I see #{arg} in the hamburger menu, and am clicking on the link now"
    find(:xpath, "//div[text()='#{arg}']").click
    category_string = arg.to_s.upcase
    p  "I have opened the #{category_string} tab"
  end

  def self.go_to_subcategory(arg)
    expect(page).to have_selector(:xpath, "//p/a[contains(.,'#{arg}')]")
    p  "I see #{arg} subcategory in the hamburger menu, and am clicking on the link now"
    find(:xpath, "//p/a[contains(.,'#{arg}')]").click
    category_string = arg.to_s.upcase
    p  "I have opened the #{category_string} tab"
  end

  def self.on_catalog_page(arg)
    expect(page).to have_selector(:xpath, "//div[contains(.,'#{arg}')]")
    p  "I am on the #{arg} catalog page"
    expect(page).to have_selector(:xpath, "//div[@class='collections-grid']")
    grid_count = find_all(:xpath, "(//div[@class='collections-grid']/div[contains(@class, 'collections-grid-item')])").count
    p  "I see #{grid_count} magazines on the page. They are listed below:"
    for i in 1..grid_count
      p  magazine_results = find(:xpath, "(//div[@class='collections-grid']/div[contains(@class, 'collections-grid-item')])[#{i}]").text
    end
  end

  def self.random_press_catalog_page
    expect(page).to have_selector(:xpath, "//div[@class='collections-grid']")
    grid_count = find_all(:xpath, "(//div[@class='collections-grid']/div[contains(@class, 'collections-grid-item')])").count
    i = Random.rand( 1...grid_count)
    random_selected_catalog = find(:xpath, "(//div[@class='collections-grid']/div[contains(@class, 'collections-grid-item')])[#{i}]").text
    find(:xpath, "(//div[@class='collections-grid']/div[contains(@class, 'collections-grid-item')])[#{i}]").click
    p  "I've clicked on the #{random_selected_catalog} catalog"
  end

  def self.on_plp_page
    expect(page).to have_selector(:xpath, "(//div[@data-page='Subcategory']//span/span[text()])[1]")
    plp_header = find(:xpath, "(//div[@data-page='Subcategory']//span/span[text()])[1]").text
    p  "I am on the #{plp_header} PLP page"
  end

  def self.random_collection_page
    expect(page).to have_selector(:xpath, "//div[@data-page='Category']/div/div/ul")
    collection_count = find_all(:xpath, "//div[@data-page='Category']/div/div/ul/li").count
    p  "I see #{collection_count} collections. I see the following collections:"
    for i in 1..collection_count
      p  category_list = find(:xpath, "(//div[@data-page='Category']/div/div/ul/li)[#{i}]").text
    end
    i = Random.rand( 1...collection_count)
    random_collection_text = find(:xpath, "(//div[@data-page='Category']/div/div/ul/li)[#{i}]").text
    find(:xpath, "(//div[@data-page='Category']/div/div/ul/li)[#{i}]").click
    p  "I've clicked on #{random_collection_text}"
  end

  def self.plp_collection_check
    if page.has_selector?(:xpath, "//div[@data-page='Category']/div/div/ul")
      p  "Collection has lead to another collection page."
      expect(page).to have_selector(:xpath, "//div[@data-page='Category']/div/div/ul")
      grid_count = find_all(:xpath, "(//div[@data-page='Category']/div/div/ul/li)").count
      i = Random.rand( 1...grid_count)
      random_selected_collection = find(:xpath, "(//div[@data-page='Category']/div/div/ul/li)[#{i}]").text
      find(:xpath, "(//div[@data-page='Category']/div/div/ul/li)[#{i}]").click
      p  "I've clicked on the #{random_selected_collection} page"
    else
      p  "We are not on another collections page"
    end
  end

  def self.random_catalog_page
    expect(page).to have_selector(:xpath, "//div[@class='catalog-item']")
    collection_count = find_all(:xpath, "//div[@class='catalog-item']").count
    p  "I see #{collection_count} catalogs. I see the following catalogs:"
    for i in 1..collection_count
      p  category_list = find(:xpath, "(//div[@class='catalog-item'])[#{i}]").text
    end
    i = Random.rand( 1...collection_count)
    random_collection_text = find(:xpath, "(//div[@class='catalog-item'])[#{i}]").text
    find(:xpath, "(//div[@class='catalog-item'])[#{i}]").click
    p  "I've clicked on #{random_collection_text}"
  end

  def self.check_blog_page
    expect(page).to have_selector(:xpath, "//div[@class='blog-content-page']")
    blog_page_title = find(:xpath, "//div[@data-page='Blog']//div[@role='button']").text
    p  "Currently on the #{blog_page_title} blog page"
  end

  def self.press_on_random_catalog
    catalogs_count_on_page = find_all(:xpath, "//div[@class='catalog-item']").count
    random_catalog = Random.rand(1...catalogs_count_on_page)
    random_catalog_name = find(:xpath, "(//div[@class='catalog-item'])[#{random_catalog}]").text
    p  "I see #{catalogs_count_on_page} catalogs on page"
    find(:xpath, "(//div[@class='catalog-item'])[#{random_catalog}]").click
    p  "I've clicked on #{random_catalog_name} catalog"
  end

  def self.select_random_item
    if page.has_selector?(:xpath, "//li//a//div[contains(.,'New')]")
      item_count_on_page = find_all(:xpath, "//div[@data-page='Subcategory']//li").count
      random_item_index = Random.rand(1..item_count_on_page)
      item_name_on_plp = find(:xpath, "(//div[@data-page='Subcategory']//li)[#{random_item_index}]").text
      find(:xpath, "(//div[@data-page='Subcategory']//li)[#{random_item_index}]").click
      p  "I've clicked on #{item_name_on_plp} image"
      item_name_on_pdp = find(:xpath, "//span[contains(.,'$')]//parent::div//parent::div/h6").text
      assert_text(item_name_on_plp = item_name_on_pdp)
      p  "I see correct #{item_name_on_pdp} PDP"
    elsif
    page.assert_selector(:xpath, "//div[@id]//li")
      item_count_on_page = find_all(:xpath, "//div[@id]//li").count
      random_item_index = Random.rand(1..item_count_on_page)
      item_name_on_plp = find(:xpath, "(//li//a/div[2])[#{random_item_index}]").text
      find(:xpath, "(//div[@id]//li)[#{random_item_index}]").click
      p  "I've clicked on #{item_name_on_plp} image"
      item_name_on_pdp = find(:xpath, "//span[contains(.,'$')]//parent::div//parent::div/h6").text
      assert_text(item_name_on_plp = item_name_on_pdp)
      p  "I see correct #{item_name_on_pdp} PDP"

    end
  end

  def self.press_on_random_collection
    find(:xpath, "//div[@data-page='Category']//span[text()='Show More']").click
    collections_count_on_page = find_all(:xpath, "//div[@data-page='Category']//li").count
    random_collection = Random.rand(1...collections_count_on_page)
    random_catalog_name = find(:xpath, "(//div[@data-page='Category']//li)[#{random_collection}]//div[text()=..]").text
    p  "I see #{collections_count_on_page} catalogs on page"
    find(:xpath, "(//div[@data-page='Category']//li)[#{random_collection}]").click
    p  "I've clicked on #{random_catalog_name} catalog"
    category_page_name = find(:xpath, "(//div[@data-page='Subcategory']//span)[3]").text
    assert_text(random_catalog_name = category_page_name)

  end


  def self.an_get_item_parameters_on_category_page (item_index_in_the_list)
    item_text = find(:xpath, "//li[#{item_index_in_the_list}]").text
    item_parameters = item_text.split(/\n/)
    item_name = item_parameters[0]
    item_price = item_parameters[1]
    return item_name , item_price

    # TODO: adjust this to account for sale items as well
  end



  def self.get_text_from_category_filter
    page.assert_selector(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div")
    filter_text = find(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div").text
    p  "I appear on #{filter_text} page"
    return filter_text
  end

# TODO: This fix does not work consistently, and is an issue still under investigation. Clicking within iframes appears to be the issue for this.

  def self.close_email_popup
    until page.has_no_xpath?('//iframe[@id="fcopt-offer-57579-content"]')
      within_frame "fcopt-offer-57579-content" do
        p "Trying to close pop-up. If this message keeps repeating, please close the pop-up manually to proceed with test."
        click_on('Close Dialog')
      end
    end
    p "Pop-up closed!"
  end

end
