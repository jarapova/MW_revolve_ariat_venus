# In this module we collecting methods for cart page of REVOLVE
require 'capybara/cucumber'

module REV_CartPage
  extend Capybara::DSL
  extend RSpec::Matchers

  CART_PAGE_PREFIX = "revolve:cart_page:"

  def self.expect_content(content_name)
    VN_AllPage.update_page
    p "Expecting #{content_name}"
    if content_name == 'empty_cart_page_content'
      p "Expecting empty cart page content"
      expect_empty_cart_page_content
    elsif content_name == 'guest_cart_page_content'
      p "Expecting guest cart page content"
      expect_guest_page_content
    elsif content_name == 'logged_in_cart_page_content'
      p "Expecting logged in user cart page content"
      expect_logged_in_content
    elsif content_name == 'sign_in_modal_content'
      REV_ProductListingPage.expect_account_modal_content
    elsif content_name == 'sign_in_modal_closed'
      main_text_locator = rev_get_plp_content['account_modal_locators']['main_text']
      page.assert_no_selector(:xpath, main_text_locator)
      p "Account modal is closed"
    elsif content_name == 'correct_pricing_content'
      expect_correct_pricing
    elsif content_name == 'shipping_delivery_content'
      expect_shipping_delivery_content
    elsif content_name == 'returns_content'
      expect_returns_content
    elsif content_name == 'review_bag_banner'
      expect_review_banner
    elsif content_name.include? 'remembered'
      expect_remembered_content(content_name)
    elsif content_name == 'afterpay_content'
      expect_afterpay_content
    elsif content_name == 'e_certificate_with_message'
      expect_certificate(true, true)
    elsif content_name == 'e_certificate_with_no_message'
      expect_certificate(true, false)
    elsif content_name == 'standard_certificate_with_message'
      expect_certificate(false, true)
    elsif content_name == 'standard_certificate_with_no_message'
      expect_certificate(false, false)
    elsif content_name == 'afterpay_modal_content'
      expect_afterpay_modal_content
    elsif content_name.match? /no_[\d]+_item_name/
      expect_no_item(content_name)
    elsif content_name == 'wedding_warning_message'
      page.assert_text("gowns must be returned within")
      page.assert_text("for a full refund or store credit")
      p "I see wedding warning message"
    elsif content_name == 'beauty_warning_message'
      page.assert_text("Return within")
      page.assert_text("days if unopened and unused")
      p "I see beauty warning message"
    elsif content_name.include? 'item'
      item = parse_item_value(content_name)
      locators = rev_get_cart_page_content['items_locators']
      locators = locators.merge(rev_get_cart_page_content['optional_items_locators'])
      page.assert_selector(:xpath, locators[item[:locator_name]] + "[#{item[:number]}]")
      p "I see #{item[:locator_name]} on item #{item[:number]}"
    else
      raise StandardError.new "No such locator or content found"
    end
  end

  def self.expect_empty_cart_page_content
    empty_cart_page_locators = rev_get_cart_page_content['empty_cart_page_locators']
    empty_cart_page_locators.each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name}"
    end
    REV_AccountPage.expect_help_us_improve_frame_content
  end

  def self.expect_guest_page_content
    scroll_page(0.7, 2)
    close_review_bag_banner
    guest_cart_page_locators = rev_get_cart_page_content['guest_cart_page_locators']
    if page.has_text?("Preorder")
      guest_cart_page_locators = guest_cart_page_locators.merge rev_get_cart_page_content['preorder_locators']
    else
      guest_cart_page_locators = guest_cart_page_locators.merge rev_get_cart_page_content['subtotal_locators']
    end
    p guest_cart_page_locators
    guest_cart_page_locators.each do |name, value|
      page.assert_selector(:xpath, value) #ta_bug
      p "I see #{name}"
    end
    expect_items_on_cart_page
  end

  def self.expect_logged_in_content
    close_review_bag_banner
    guest_cart_page_locators = rev_get_cart_page_content['logged_in_cart_page_locators']
    guest_cart_page_locators.each do |name, locator|
      page.assert_selector(:xpath, locator) #ta_bug
      p "I see #{name}"
    end
    expect_logged_items_on_cart_page
  end

  def self.expect_items_on_cart_page
    VN_AllPage.update_page
    item_locators = rev_get_cart_page_content['items_locators']
    items_count = find_all(:xpath, item_locators['item_name']).count
    expect(items_count).to be > 0
    (1..items_count).each do |item_number|
      p "Checking item #{item_number}"
      item_locators.each do |name, value|
        page.assert_selector(:xpath, value + "[#{item_number}]") #ta_bug
        p "I see #{name}"
      end
    end
  end

  def self.expect_logged_items_on_cart_page
    VN_AllPage.update_page
    item_locators = rev_get_cart_page_content['logged_items_locators']
    items_count = find_all(:xpath, item_locators['item_name']).count
    expect(items_count).to be > 0
    (1..items_count).each do |item_number|
      p "Checking item #{item_number}"
      item_locators.each do |name, value|
        page.assert_selector(:xpath, value + "[#{item_number}]") #ta_bug
        p "I see #{name}"
      end
    end
  end

  def self.click_element(element_name)
    if element_name.include? 'item'
      item_number = element_name.sub('item_', '').to_i
      element_to_click = element_name.sub("_#{item_number}", "")
      p element_to_click
      items_locators = rev_get_cart_page_content['logged_items_locators']
      items_locators = items_locators.merge(rev_get_cart_page_content['items_locators'])
      element_locator = items_locators[element_to_click]
      find(:xpath, m_ta(CART_PAGE_PREFIX + element_to_click + item_number.to_s,
                        element_locator + "[#{item_number}]")).click
      p "Clicked #{element_name}"
    else
      sleep 5
      cart_page_locators = rev_get_cart_page_content['empty_cart_page_locators']
      cart_page_locators = cart_page_locators.merge(rev_get_cart_page_content['guest_cart_page_locators'])
      cart_page_locators = cart_page_locators.merge(rev_get_cart_page_content['logged_in_cart_page_locators'])
      cart_page_locators = cart_page_locators.merge(rev_get_cart_page_content['afterpay_locators'])
      if (cart_page_locators[element_name])
        find(:xpath, m_ta(CART_PAGE_PREFIX + element_name, cart_page_locators[element_name])).click
        p "I clicked #{element_name} on cart_page"
        sleep 5
      else
        raise StandardError.new "No such locator or content found"
      end
    end
  end

  def self.set_element_with_value(element_name, element_value)
    if element_name.include? 'item_qty'
      sleep 3
      item_number = element_name.sub('_item_qty', '').to_i
      qty_dropdown_locator = rev_get_cart_page_content['items_locators']['item_qty_dropdown']
      find(:xpath, m_ta(CART_PAGE_PREFIX + "item_qty_dropdown" + item_number.to_s,
                        qty_dropdown_locator + "[#{item_number}]")).click
      sleep 3
      p element_value.to_i
      item_qty_locator = "(//ul[@role='listbox']//li)[#{element_value.to_i + 1}]"
      page.assert_selector(:xpath, item_qty_locator)
      find(:xpath, item_qty_locator).click
      p "Setted #{element_value.to_i + 1} list value (size is #{element_value.to_i})"
      sleep 2
    elsif element_name.include? 'item_size'
      item_number = element_name.sub('_item_size', '').to_i
      size_dropdown_locator = rev_get_cart_page_content['items_locators']['item_size_dropdown']
      find(:xpath, m_ta(CART_PAGE_PREFIX + "item_size_dropdown" + item_number.to_s,
                        size_dropdown_locator + "[#{item_number}]")).click
      sleep 1
      item_size_locator = "(//ul[@role='listbox']//li[text()='#{element_value}'])"
      page.assert_selector(:xpath, item_size_locator)
      find(:xpath, item_size_locator).click
      p "Setted #{element_value} in size dropdown"
      sleep 1
    end
  end

  def self.expect_element_with_value(element_name, element_value)
    page.visit(page.current_url)
    if element_name.include? 'item_qty'
      item_number = element_name.sub('_item_qty', '')
      item_qty_dropdown_locator = rev_get_cart_page_content['items_locators']['item_qty_dropdown']
      actual_item_dropdown_qty = find(:xpath, m_ta(CART_PAGE_PREFIX + "item_qty_dropdown" + item_number,
                                                   item_qty_dropdown_locator + "[#{item_number}]")).text.to_i
      p "AC: #{actual_item_dropdown_qty} EX: #{element_value.to_i}"
      expect(actual_item_dropdown_qty).to eq element_value.to_i
      p "Dropdown qty on item #{item_number} correct"
    elsif element_name.include? 'item_size'
      item_number = element_name.sub('_item_size', '')
      item_size_dropdown_locator = rev_get_cart_page_content['items_locators']['item_size_dropdown']
      actual_item_dropdown_size = find(:xpath, m_ta(CART_PAGE_PREFIX + "item_size_dropdown" + item_number,
                                                    item_size_dropdown_locator + "[#{item_number}]")).text
      p "AC: #{actual_item_dropdown_size} EX: #{element_value}"
      expect(actual_item_dropdown_size).to eq element_value
      p "Dropdown size are correct"
    end
  end

  def self.expect_correct_pricing #ta_bug
    items_locators = rev_get_cart_page_content['items_locators']
    items_count = find_all(:xpath, items_locators['item_name']).count
    p "Items on cart_page: #{items_count}"
    items_prices_locator = items_locators['item_price_value']
    items_qty_locator = items_locators['item_qty_dropdown']
    total_cost = 0
    (1..items_count).each do |item_number|
      price_text = find(:xpath, items_prices_locator + "[#{item_number}]").text
      qty_text = find(:xpath, items_qty_locator + "[#{item_number}]").text
      item_cost = (price_text.gsub(',', '').match(/(\d+([,.]?)[\d]*)/).to_s.to_f) * qty_text.to_i
      p "Item #{item_number} qty:#{qty_text.to_i} price:#{item_cost} total_cost: #{item_cost}"
      total_cost += item_cost
    end
    p "Total cost: #{total_cost}"
    expect_equal_subtotal
    cart_page_locators = rev_get_cart_page_content['subtotal_locators']
    page_text_subtotal_2 = find(:xpath, cart_page_locators['subtotal_2_value']).text #ta_bug
    p subtotal_2 = page_text_subtotal_2.gsub(',', '').match(/(\d+([,.]?)[\d]*)/).to_s
    p "Subtotal_2: #{subtotal_2.to_f}"
    expect(total_cost).to eq subtotal_2.to_f
    expect_correct_total
  end

  def self.expect_equal_subtotal #ta_bug
    p "Expecting equal subtotals"
    cart_page_locators = rev_get_cart_page_content['subtotal_locators']
    page_text_subtotal_1 = find(:xpath, cart_page_locators['subtotal_1_value']).text
    p subtotal_1 = page_text_subtotal_1.gsub(',', '').match(/(\d+([,.]?)[\d]*)/).to_s.to_f
    page_text_subtotal_2 = find(:xpath, cart_page_locators['subtotal_2_value']).text
    p subtotal_2 = page_text_subtotal_2.gsub(',', '').match(/(\d+([,.]?)[\d]*)/).to_s.to_f
    expect(subtotal_1).to eq subtotal_2
    p "Subtotals are equal"
  end

  def self.expect_correct_total
    cart_page_locators = rev_get_cart_page_content['guest_cart_page_locators']
    subtotal_locators = rev_get_cart_page_content['subtotal_locators']
    p subtotal_2_text = find(:xpath, subtotal_locators['subtotal_2_value']).text #ta_bug
    subtotal_2 = subtotal_2_text.match(/(\d+([,.]?)[\d]*)/).to_s.to_f
    p shipping_value_text = find(:xpath, m_ta(CART_PAGE_PREFIX + "shipping_value",
                                              cart_page_locators['shipping_value'])).text
    shipping_price = 0
    if shipping_value_text != 'FREE'
      shipping_price = shipping_value_text.match(/(\d+([,.]?)[\d]*)/).to_s.to_f
      p "Shipping price is #{shipping_price}"
    end

    estimated_total_text = find(:xpath, cart_page_locators['estimated_value']).text
    estimated_total_price = estimated_total_text.match(/(\d+([,.]?)[\d]*)/).to_s.to_f
    expect(subtotal_2 + shipping_price).to eq estimated_total_price
    p "Estimated total is correct"
  end

  def self.expect_equal_preorder
    p "Expecting equal preorders"
    cart_page_locators = rev_get_cart_page_content['preorder_locators']
    page_text_preorder_1 = find(:xpath, cart_page_locators['preorder_1_value']).text
    p preorder_1 = page_text_preorder_1.gsub(',', '').match(/(\d+([,.]?)[\d]*)/).to_s.to_f
    page_text_preorder_2 = find(:xpath, cart_page_locators['preorder_2_value']).text
    p preorder_2 = page_text_preorder_2.gsub(',', '').match(/(\d+([,.]?)[\d]*)/).to_s.to_f
    expect(preorder_1).to eq preorder_2
    p "Preorders are equal"
  end

  def self.expect_shipping_delivery_content #ta_bug
    shipping_prefix = "revolve:shipping_and_delivery:"
    page.assert_selector(:xpath, m_ta(shipping_prefix + "main_text",
                                      "//h1[text()='Shipping & Delivery']"))
    page.assert_selector(:xpath, "//div[contains(@class, 'accordion__item') and contains(., 'Shipping')]")
    p section_text = find(:xpath, "//section").text
    expect(section_text.length).to be > 15
    rev_get_cart_page_content['shipping_and_delivery_text']['accordions'].each do |name, text|
      accordion_locator = "//div[contains(@class, 'accordion__item') and contains(., '#{text}')]"
      page.assert_selector(:xpath, m_ta(shipping_prefix + name,
                                        accordion_locator))
      p "I see #{name} accordion"
      find(:xpath, accordion_locator).click
      sleep 1
      p section_text = find(:xpath, m_ta(shipping_prefix + name + ":section_text",
                                         accordion_locator + "//section")).text
      expect(section_text.length).to be > 15
    end
    page.assert_selector(:xpath, m_ta(shipping_prefix + "returns_info_text",
                                      "//*[contains(text(), 'LOOKING FOR INFO ON RETURNS?')]"))
    returns_link = "//*[contains(text(), 'LOOKING FOR INFO ON RETURNS?')]//following::a[contains(text(), 'Click')]"
    page.assert_selector(:xpath, m_ta(shipping_prefix + "returns_info_link", returns_link))
    REV_AccountPage.expect_help_us_improve_frame_content
  end

  def self.click_returns_link
    shipping_prefix = "revolve:shipping_and_delivery:"
    returns_link = "//*[contains(text(), 'LOOKING FOR INFO ON RETURNS?')]//following::a[contains(text(), 'Click')]"
    find(:xpath, m_ta(shipping_prefix + "returns_info_link", returns_link)).click
  end

  def self.expect_returns_content
    returns_prefix = "revolve:returns_page:"
    page.assert_selector(:xpath, m_ta(returns_prefix + "returns_text",
                                      "//h1[text()='Returns & Exchanges']"))
    rev_get_cart_page_content['returns_and_exchanges']['accordions'].each do |name, text|
      accordion_locator = "//div[contains(@class, 'accordion__item') and contains(., '#{text}')]"
      alternative_text_locator = " | //div[contains(@class, 'accordion__item') and contains(., '#{text.downcase}')]"
      accordion_locator = "(#{accordion_locator} #{alternative_text_locator})[1]"
      page.assert_selector(:xpath, accordion_locator)
      p "I see #{name} accordion"
      find(:xpath, accordion_locator).click
      sleep 1
      p section_text = find(:xpath, accordion_locator).text #ta_bug
      expect(section_text.length).to be > 15
    end
    REV_AccountPage.expect_help_us_improve_frame_content
  end

  def self.remember_content(content_name)
    if content_name.include? "items_names"
      items_names_locator = rev_get_cart_page_content['items_locators']['item_name']
      elements = []
      find_all(:xpath, items_names_locator).each do |element|
        elements.push(element.text)
      end
      if not ($revolve_stored_information.key?(content_name))
        $revolve_stored_information[content_name] = []
      end
      elements.each do |element|
        $revolve_stored_information[content_name].push(element)
      end
      p "Items remembered #{$revolve_stored_information}"
    elsif content_name.include? 'item_name'
      item_number = content_name.sub('_item_name', '')
      items_names_locator = rev_get_cart_page_content['items_locators']['item_name']
      item_name = find(:xpath, items_names_locator + "[#{item_number}]").text
      $revolve_stored_information[content_name] = item_name
    end
  end

  def self.expect_remembered_content(content_name)
    content_key = content_name.sub('remembered_', '')
    p content_key
    p $revolve_stored_information
    p $revolve_stored_information[content_key]
    $revolve_stored_information[content_key].each do |element|
      page.assert_selector(:xpath, "//*[contains(text(), '#{element}')]")
      p "I see #{element} on cart_page"
    end
  end

  def self.expect_review_banner
    locators = rev_get_cart_page_content['revivew_bag_banner']
    ta_locator_prefix = CART_PAGE_PREFIX + 'revivew_bag_banner:'
    locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(ta_locator_prefix + name, locator))
      p "I see #{name} on logged in cart_page"
    end
  end

  def self.expect_afterpay_content
    rev_get_cart_page_content['afterpay_locators'].each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name}"
    end
    text_locator = rev_get_cart_page_content['afterpay_locators']['afterpay_text']
    afterpay_text = find(:xpath, text_locator).text
    p installments = afterpay_text[afterpay_text.index('Or ')+3..afterpay_text.index(' installments')-1]
    expect(installments.to_i).to be >= 1
  end

  def self.expect_afterpay_modal_content
    rev_get_cart_page_content['afterpay_modal_locators'].each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name} on afterpay_modal"
    end
    p images_count = find_all(:xpath, "//*[text() = 'Installments by']/..//img[@src]").count
    expect(images_count).to be >= 3
    p "Image count is correct"
  end

  def self.expect_no_item(item_element)
    # page.visit(page.current_url)
    item_key = item_element.sub("no_", '')
    item_name = $revolve_stored_information[item_key]
    page.assert_no_selector(:xpath, "//*[contains(text(), '#{item_name}')]")
    p "I can`t see #{item_name} on cart_page"
  end

  def self.clear_cart_page
    p "Clearing cart page"
    item_name_locator = rev_get_cart_page_content['items_locators']['item_name']
    remove_button_locator = rev_get_cart_page_content['items_locators']['item_remove_button']
    VN_AllPage.update_page
    VN_AllPage.update_page
    items_count = find_all(:xpath, item_name_locator).count
    if items_count > 0
      p items_count
      items_count.times do |i|
        locator = remove_button_locator + "[1]"
        VN_AllPage.scroll_to_element(locator)
        sleep 1
        find(:xpath, locator).click
        p "***** #{i} *****"
        sleep 5
        page.visit(page.current_url)
        sleep 5
        VN_AllPage.update_page
        sleep 5
      end
    end
    p "Cart page is cleared"
  end

  def self.expect_certificate(isEmail, isMessage)
    email_label_locator = "//*[contains(text(), 'To:')]"
    email_value_locator = "//*[contains(text(), 'To:')]//following-sibling::*[text()]"
    if isEmail
      p "Expecting email certificate"
      page.assert_selector(:xpath, email_label_locator)
      email = find(:xpath, email_value_locator).text
      expect(email).to eq $revolve_stored_information['gift_email']
      page.assert_selector(:xpath, "//*[contains(text(), 'eGift Certificate')]")
      page.assert_selector(:xpath, "//*[contains(text(), 'Email Delivery')]")
    else
      p "Expecting standard delivery ticket"
      page.assert_selector(:xpath, "//*[contains(text(), 'Gift Certificate')]")
      page.assert_selector(:xpath, "//*[contains(text(), 'Standard Delivery')]")
      page.assert_no_selector(:xpath, email_label_locator)
      page.assert_no_selector(:xpath, email_value_locator)
    end
    p "Expecting message"
    message_label_locator = "//*[contains(text(), 'Message:')]"
    page.assert_selector(:xpath, message_label_locator)
    message = find(:xpath, "//*[contains(text(), 'Message:')]//following-sibling::*[text()]").text
    if isMessage
      expect(message).to eq $revolve_stored_information['gift_message']
    else
      expect(message).to eq "None"
    end
    p "Expecting no locators"
    items_locators = rev_get_cart_page_content['items_locators']
    page.assert_none_of_selectors(:xpath, items_locators['item_color'],
                                  items_locators['item_size_dropdown'],
                                  items_locators['item_qty_dropdown'])
  end

  def self.expect_no_content(content_name)
    if content_name.include? 'item'
      item = parse_item_value(content_name)
      items_locator = rev_get_cart_page_content['items_locators'][item[:locator_name]]
      item_locator = items_locator + "[#{item[:number]}]"
      page.assert_no_selector(:xpath, item_locator)
      p "I can not see #{content_name}"
    else
      locators = rev_get_cart_page_content['guest_cart_page_locators']
      locators = locators.merge(rev_get_cart_page_content['logged_in_cart_page_locators'])
      if locators[content_name]
        page.assert_no_selector(:xpath, locators[content_name])
        p "I can not see #{content_name} on cart_page"
      else
        raise StandardError.new "No such locator or content found"
      end
    end
  end

  def self.close_review_bag_banner
    locator = "//*[contains(text(), 'Please re')]/following-sibling::*[contains(text(), 'lose')]"
    find(:xpath, locator).click if page.has_selector?(:xpath, locator, wait: 3)
    sleep 0.5
    p "I closed review bag banner"
  end

end