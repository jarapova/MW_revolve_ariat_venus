# In this module we collect methods for the product page of ANNIE SELKE
require 'capybara/cucumber'


module AN_ProductPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.click_add_to_bag
    p  "I want to add item to cart"
    p  "Item parameters are:"
    AN_ProductPage.get_product_parameters_pdp_page
    find(:xpath, "//div[@data-page='Product']/div/div/div/button[@on='tap:form.submit']//span[contains(., 'Add to Cart')]").click
    p  "I've clicked Add to bag"
    sleep(3)
    #page.assert_selector(:xpath,"//button/span[contains(., 'View Cart')]")
    items_in_cart = find(:xpath, "//button[@aria-label='Cart']/span/div[text()]").text
    expect(items_in_cart.to_i).to  be > 0
    p  "There are #{items_in_cart} items in the cart"
  end

  def self.expect_pdp_page
    visit AN_TESTITEM_URL
    AN_NavigationPage.close_email_popup
    AN_ProductPage.get_product_parameters_pdp_page
    AN_ProductPage.get_available_product_sizes
    sleep 2
  end

  def self.add_item1_to_wishlist(item1)
    page.assert_selector(:xpath, "//div[@data-page='Product']//span[text()='+ wish list']/parent::button")
    $item1 = an_get_product_parameters_pdp_page[1]
    item1 = $item1
    p  "Ading #{item1} to wish list"
    find(:xpath, "//div[@data-page='Product']//span[text()='+ wish list']/parent::button").click
    p  "I've clicked on +wish list button"
    page.assert_selector(:xpath, "//div[@class='wishlist_block']/input[@type='submit' and @value='+ MOVE ALL ITEMS TO BAG']")
    p  "I am on wish list page"
  end
  def self.view_pdp_bar(arg)
    if arg == "Complete the Look"
      page.assert_selector(:xpath, "//ul/h6[text()='Complete the Look']")
      p  "There is a #{arg} section on this PDP page"
    elsif arg == "Related Products"
      page.assert_selector(:xpath, "//h6[text()='Related Products']")
      p  "There is a #{arg} section on this PDP page"
    end
  end
  def self.random_select_pdp_bar(arg)
    if arg == "Complete the Look"
      ctl_count = find_all(:xpath, '//ul//a').count
      p  "I see #{ctl_count} items in the Complete the Look section. I see the following items:"
      for i in 1..ctl_count
        p  category_list = find(:xpath, "(//ul//a)[#{i}]").text
      end
      if ctl_count == 1
        random_ctl_text = find(:xpath, "(//ul//a)").text
        find(:xpath, "(//ul//a)").click
        p  "I've clicked on #{random_ctl_text}"
      else
        i = Random.rand( 1...ctl_count)
        random_ctl_text = find(:xpath, "(//ul//a)[#{i}]").text
        find(:xpath, "(//ul//a)[#{i}]").click
        p  "I've clicked on #{random_ctl_text}"
      end
    elsif arg == "Related Products"
      rp_count = find_all(:xpath, "//div/a/h6").count
      p  "I see #{rp_count} items in the Related Products section. I see the following items:"
      for i in 1..rp_count
        p  category_list = find(:xpath, "(//div/a/h6)[#{i}]").text
      end
      if rp_count == 1
        random_ctl_text = find(:xpath, "(//div/a/h6)").text
        find(:xpath, "(//div/a/h6)").click
        p  "I've clicked on #{random_ctl_text}"
      else
        i = Random.rand( 1...rp_count)
        random_ctl_text = find(:xpath, "(//div/a/h6)[#{i}]").text
        find(:xpath, "(//div/a/h6)[#{i}]").click
        p  "I've clicked on #{random_ctl_text}"
      end
    end
  end
  def self.verify_pdp_page
    page.assert_selector(:xpath, "//div[@data-page='Product']")
    p  "I am on a PDP page"
  end

  def self.get_available_product_sizes
    # Open the size selector
    find(:xpath, "//div[@data-page='Product']/div/div/div/button[text()='Select size']").click
    sleep(2)
    available_item_sizes = find_all(:xpath, '//div[contains(@class,"mui-fixed")]/div[2]/div/div/div/div').count
    size_name_array = Array.new
    for i in 1..available_item_sizes
      available_item_sizes_names = find(:xpath, "//div[contains(@class,'mui-fixed')]/div[2]/div/div/div/div[#{i}]").text.split("\n")
      size_name_array << available_item_sizes_names
    end
    p  "There are #{size_name_array} sizes available for current item"
    # Close the size selector
    find(:xpath, "//div[contains(@class, 'mui-fixed')]//button").click
    return size_name_array
  end


  def self.get_product_parameters_pdp_page
    parameters_array = Array.new
    parameters_array << product_id = find(:xpath, "//input[@name = 'id']", visible: false)[:value]
    parameters_array <<  product_brand = find(:xpath, "//input[@name = 'brand']", visible: false)[:value].upcase
    parameters_array <<  product_color = find(:xpath, "//button[@aria-selected='true']//img", visible: false)[:alt]
    parameters_array <<  product_name = find(:xpath, "//input[@name = 'name']", visible: false)[:value]
    parameters_array <<  product_price = if has_selector?(:xpath, "(//div[contains(@data-page, 'Product')]//span[contains(., '$')]/span[contains(., '$')])[1]")
                                           sale_price = find(:xpath, "(//div[contains(@data-page, 'Product')]//span[contains(., '$')]/span[contains(., '$')])[1]").text
                                           find(:xpath, "(//div[contains(@data-page, 'Product')]//span[contains(., '$')])[1]").text.gsub(sale_price, '')
                                         else
                                           find(:xpath, "(//div[contains(@data-page, 'Product')]//span[contains(., '$')])[1]").text
                                         end
    parameters_array <<  product_price_discounted = if has_selector?(:xpath, "(//div[contains(@data-page, 'Product')]//span[contains(., '$')]/span[contains(., '$')])[1]")
                                                      find(:xpath, "(//div[contains(@data-page, 'Product')]//span[contains(., '$')]/span[contains(., '$')])[1]").text
                                                    else
                                                      "the same as the current price. It is not on sale."
                                                    end
    if page.has_xpath?("//div[@data-page='Product']/div/div/div/button[text()='Select size']")
      parameters_array <<  product_size = "not yet selected"
    else
      parameters_array <<  product_size = find(:xpath, "//div[@data-page='Product']/div/div/div/button[text()]").text
    end

    expect(page).to have_selector(:xpath, "//span[contains(., 'Add to Cart')]")
    p  "I am on #{product_name} PDP page "
    p  "Product id is #{product_id}"
    p  "Product name is #{product_name}"
    p  "Product brand is #{product_brand}"
    p  "Product size is #{product_size}"
    p  "Product price is #{product_price}"
    p  "Product price was originally #{product_price_discounted}"
    p  "Product color is #{product_color}"
    return parameters_array
  end

  def self.select_random_item_qty
    random_qty = Random.rand(1...10)
    random_qty_countdown = random_qty
    while random_qty_countdown > 0 do
      find(:xpath, "//button[@aria-label='subtract one quantity']").click
      random_qty_countdown = random_qty_countdown - 1
    end
    p  "I've added #{random_qty} qty"
    get_qty = find(:xpath, "//input[@aria-label='quantity']")[:value]
    get_qty = get_qty.to_i - 1
    expect(random_qty.to_s).to eq(get_qty.to_s)
    p  "Preselected #{random_qty} equal expected #{get_qty}"
  end

  def self.select_random_item_color
    item_colors_count = find_all(:xpath, "//button//img", visible: false).count
    if item_colors_count == 0
      p  "There is no colors for selected product"
    elsif item_colors_count == 1
      p  "There is only one color, and it is already selected."
    elsif item_colors_count == 2
      find(:xpath, "//button[1]//img", visible: false).click
      sleep 1
      color_name = find(:xpath, "//button//img", visible: false)[:alt]
      p  "I've selected #{color_name}"
      sleep 1
    elsif
    color_random_index = Random.rand(1...item_colors_count)
      find(:xpath, "//button[#{color_random_index}]//img").click
      sleep 1
      color_name = find(:xpath, "//button[#{color_random_index}]//img").text
      p  "I've selected #{color_name}"
      sleep 1
    end
  end

# TODO: Need to test the above on PDPs with multiple colors

  def self.select_random_item_size
    find(:xpath, "//div[@data-page='Product']/div/div/div/button[text()='Select size']").click
    # Opens size selector
    page.find(:xpath, "//div[@data-page='Product']/div/div/div/button[text()='Select size']").click
    sleep(2)
    item_size_count = find_all(:xpath, '//h2[text()="Select size"]/parent::div/div').count
    if item_size_count == 0
      p  "There are no sizes for selected product"
    elsif
    item_size_count == 1
      find(:xpath, "(//h2[text()='Select size']/parent::div/div)[1]").click
      size_name = find(:xpath, "(//h2[text()='Select size']/parent::div/div)[1]").text
      p  "I've selected #{size_name} size"
      sleep 1
    elsif
    size_random_index = Random.rand(1...item_size_count)
      size_name = find(:xpath, "(//h2[text()='Select size']/parent::div/div)[#{size_random_index}]").text
      find(:xpath, "(//h2[text()='Select size']/parent::div/div)[#{size_random_index}]").click
      p  "I've selected #{size_name} size"
      sleep 1
    end
  end


end
