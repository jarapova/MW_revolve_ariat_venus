# In this module we collecting methods for cart page of VN
require 'capybara/cucumber'


module VN_CartPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.expect_element_with_value(locator_name, value)
    item_locator = vn_get_cart_page_item_1_locators[locator_name]
    get_value = find(:xpath, item_locator).text
    expect(get_value).to eq value
  end

  def self.expect_content(content_name_to_check)
    if content_name_to_check == "cart_page_content"
      if page.has_no_xpath?("//div[@class='itemContainer mw-pl-item']", wait: 15)
        locators_array = vn_get_empty_cart_page_locators
        locators_array.each do |(item_name, item_locator)|
          page.assert_selector(:xpath, item_locator)
          p  "I see #{item_name} element on cart page"
          end
      else
     locators_array = vn_get_cart_page_locators
     locators_array.each do |(item_name, item_locator)|
       page.assert_selector(:xpath, item_locator)
       p  "I see #{item_name} element on cart page"
     end
     end
    elsif content_name_to_check.include? "_hash"
      item_index = content_name_to_check.gsub("_hash","")
      item_in_hash = $vn_test_items_list[item_index]
      item_on_cart = VN_CartPage.get_first_product_parameneters_on_cart_page
      expect(item_on_cart['product_sku']).to include item_in_hash['product_sku']
      expect(item_in_hash['product_size_id']).to include item_on_cart['product_size_id']
      expect(item_on_cart['product_name']).to include item_in_hash['product_name']
      expect(item_in_hash['product_qty']).to include item_on_cart['product_qty']
      p  "I see #{item_index} item with expected parameters on cart page"
    elsif content_name_to_check.include? 'size'
      item_size = find(:xpath, "//div[@class='checkout_itemsize']//span[contains(@id, 'Size')]").text
      expect($vn_item_size).to eql(item_size)
      p "Sizes are equal"
    elsif content_name_to_check == 'cart_page_with_items_content'
      vn_get_cart_page_item_1_locators.each do |name, locator|
        page.assert_selector(:xpath, locator)
        p"I see #{name} on item on cart_page"
      end
    end
  end


  def self.get_first_product_parameneters_on_cart_page
    item_parameters_on_cart = Hash.new
    locators = vn_get_cart_page_item_1_locators
    item_parameters_on_cart['product_sku']= find(:xpath, locators['item_1_sku']).text
    item_parameters_on_cart['product_size_id']= find(:xpath, locators['item_1_size']).text
    item_parameters_on_cart['product_name']= find(:xpath, locators['item_1_name']).text
    item_parameters_on_cart['product_color']= find(:xpath, locators['item_1_color']).text
    item_parameters_on_cart['product_qty']= find(:xpath, locators['item_1_qty']).text
    return item_parameters_on_cart
  end


  def self.click_element(element_name_to_click)
    if element_name_to_click.include? 'item'
      items_locators = vn_get_cart_page_content['items_multiple_locators']
      item_number = element_name_to_click[0..element_name_to_click.index('_') - 1]
      element_name = element_name_to_click.sub(item_number + "_item_", "")
      element_locator = items_locators[element_name] + "[#{item_number}]"
    else
      cart_elements = vn_get_cart_page_locators
      cart_elements = cart_elements.merge(vn_get_empty_cart_page_locators)
      element_locator = cart_elements[element_name_to_click]
    end
    p "Element locator: #{element_locator}"
    find(:xpath, element_locator).click
    p "I've clicked #{element_name_to_click}"
  end

  def self.set_item_qty_with_value(element_name, element_value)
      product_number = element_name.gsub("_item_qty","").to_i
      qty_selector_locator = "(//span[text()='Qty:']/../../following-sibling::div[1])[#{product_number}]"
      find(:xpath, qty_selector_locator).click
      sleep 1
      # find(:xpath, "//ul[@role='listbox']/li[@data-value='#{element_value}']").click
      find(:xpath, qty_selector_locator + "//option[#{element_value}]").click
      sleep 3
      p get_qty = find(:xpath, qty_selector_locator + "//option[@selected='selected']").text
      expect(element_value.to_s).to eq(get_qty.to_s)
    end

  def self.clear_cart_page
    click_all_elements("//input[@id='ctl00_Body1_rptCart_ctl00_btnRemove']", 2)
    p "Cart page is cleared"
  end

  def self.check_order_total
    merchandise_sub_total = find(:xpath, "//div[@id='tdSubTotal']/span").text
    merchandise_sub_total = merchandise_sub_total.gsub("$", "").to_f
    estimated_shipping = find(:xpath, "//div[@id='tdShipping']/span").text
    estimated_shipping = estimated_shipping.gsub("$", "").to_f
    actual_order_total = find(:xpath, "//span[@id='ctl00_Body1_lblTotal']").text
    actual_order_total = actual_order_total.gsub("$", "").to_f
    expected_order_total = merchandise_sub_total + estimated_shipping
    expect(actual_order_total).to be == expected_order_total
  end

  def self.fill_offer_code_field_with_offer_code
  page.assert_selector(:xpath, "//div[@class='mw-applied-offer-info']/following-sibling::input")
  offer_code = find(:xpath, "(//div[@class='promadInner']/b[@class='ytxt'])[2]").text
  find(:xpath, "//div[@class='mw-applied-offer-info']/following-sibling::input").set offer_code
  p  "I entered #{offer_code} offer code"
  end

  def self.check_applied_offer_code
  page.assert_selector(:xpath, "//span[@id='ctl00_Body1_lblAppliedPromo']")
  page.assert_selector(:xpath, "//label[text()='Offer code successfully updated.']")
  p  "I see applied offer code"
  end

end