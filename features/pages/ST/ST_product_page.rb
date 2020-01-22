# In this module we collecting methods for product page of ST
require 'capybara/cucumber'
require 'date'

module ST_ProductPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.expect_pdp_page
    ST_ProductPage.get_product_parameters_pdp_page
  end

  def self.select_item_size(size)
    find(:xpath, "//*[contains(text(), 'Size: ')]/following-sibling::button/span[text()='#{size}']").click
    p  "I've selected #{size} size"
  end

  def self.get_cart_info
    items = ST_ProductPage.get_items_in_cart
    items.each {|index| p index}

    File.write('gen/report_e2e/results_user_1', "#{items} NEXTTRY_______", mode: 'a')
  end

  def self.get_cart_info_1
    items = ST_ProductPage.get_items_in_cart
    items.each {|index| p index}
    time = DateTime.now.strftime('%s')
    File.write('gen/report_e2e/results_user_1', "#{items} __#{time}
", mode: 'a')
  end

  def self.get_cart_info_2
    items = ST_ProductPage.get_items_in_cart
    items.each {|index| p index}
    time = DateTime.now.strftime('%s')
    File.write('gen/report_e2e/results_user_2', "#{items} __#{time}
", mode: 'a')
  end

  def self.select_random_item_size
    available_size = ST_ProductPage.get_available_product_sizes
    # available_size.each {|index| p index}
    size = available_size.sample
      find(:xpath, "//*[contains(text(), 'Size: ')]/following-sibling::button/span[text()='#{size}']").click
      p  "I've selected #{size} size"
  end

  def self.click_add_to_bag
    p  "I want to add item to cart"
    p  "Item parameters are:"
    ST_ProductPage.get_product_parameters_pdp_page
    find(:xpath, "//span[text() ='Add To Bag']/parent::button").click
    p  "I've clicked Add to bag"
    page.assert_selector(:xpath,"(//p[text()='1 item added to your bag']/../../..)[contains(.,'View Bag')]")
    sleep 2
    find(:xpath, "//p[text()='1 item added to your bag']/../../..//button[contains(.,'View Bag')]").click
  end

  def self.get_product_parameters_pdp_page
    parameters_array = Array.new
    parameters_array << product_id = find(:xpath, "//p[contains(.,'WEB ID #:')]").text
    parameters_array <<  product_color = find(:xpath, "//p[contains(.,'Color:')]").text
    parameters_array <<  product_size = find(:xpath, "//p[contains(.,'Size')]").text
    parameters_array <<  product_name = find(:xpath, "//p[contains(.,'WEB ID #:')]/../../h1").text
    parameters_array <<  product_price = find(:xpath, "(//div[@data-page='Product']//span[contains(.,'$')])[1]").text
    # parameters_array <<  product_price_discounted = find(:xpath, "(//div[@data-page='Product']//span[contains(.,'$')])[2]").text
    page.assert_selector(:xpath, "//button[contains(.,'Description')]")
    page.assert_selector(:xpath, "//button[contains(.,'Reviews')]")
    p  "Product id is #{product_id}"
    p  "Product name is #{product_name}"
    p  "Product size ID is #{product_size}"
    p  "Product price is #{product_price}"
    # p  "Product discounted price is #{product_price_discounted}"
    p  "Product color is #{product_color}"
    # p parameters_array
    return parameters_array
  end

  def self.get_available_product_sizes
    sizes_array = Array.new
    not_available_sizes = Array.new
    product_name = find(:xpath, "//p[contains(.,'WEB ID #:')]/../../h1").text
    color_count= find_all(:xpath, "//*[contains(text(), 'Size: ')]/following-sibling::button").count
    (1..color_count).each {|index|
      size_text=find(:xpath, "(//*[contains(text(), 'Size: ')]/following-sibling::button)[#{index}]").text
      find(:xpath, "(//*[contains(text(), 'Size: ')]/following-sibling::button)[#{index}]").click
      add_to_bag = find_all(:xpath, "//span[text() ='Add To Bag']").count
      not_available = find_all(:xpath, "//span[text() ='Out of Stock']").count
      if add_to_bag == 1 and not_available ==0
        sizes_array<< size_text
      elsif
      not_available_sizes << size_text
      end
    }
      p  "There are #{not_available_sizes} not available sizes fot item #{product_name}"
      p  "There are #{sizes_array} available sizes for item #{product_name}"
    return sizes_array
  end

  def self.get_items_in_cart
    page.assert_selector(:xpath, "//h2[@class='cart__count']")
    items_in_cart = Array.new
    items_sku_array = Array.new
    items_count=find_all(:xpath, "//section[@class='cart-item__info']").count
    if items_count>1
    cart_id = find(:xpath, "//p[@class='cart__header__id']").text
    items_sku_array << cart_id
    (1..items_count).each {|index|
      p item_text= find(:xpath,"(//section[@class='cart-item__info'])[#{index}]").text
      p item_name = find(:xpath,"(//h3[@class='cart-item__name'])[#{index}]").text
      items_in_cart << item_text
      items_sku_array << item_name
    }
    elsif
    items_sku_array << "No items in cart"
    end
    p  "I've return #{items_sku_array}"
    return items_sku_array
  end
end