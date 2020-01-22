cart_page = Object
if REV_AllPage.isRevolve?
  cart_page = REV_CartPage
elsif VN_AllPage.isVenus?
  cart_page = VN_CartPage
elsif ARI_AllPage.is_ARI?
  cart_page = ARI_CartPage
end

And(/^user click "([^"]*)" on cart_page$/) do |element_name_to_click|
  cart_page.click_element(element_name_to_click)
end

And(/^user can see "([^"]*)" with value "([^"]*)" on cart_page$/) do |element_name, element_value|
  cart_page.expect_element_with_value(element_name, element_value)
end

And(/^user can see "([^"]*)" on cart_page$/) do |content_name_to_check|
  cart_page.expect_content(content_name_to_check)
end

And(/^user set "([^"]*)" with value "([^"]*)" on cart_page$/) do |element_name, element_value|
  if VN_AllPage.isVenus?
    VN_CartPage.set_item_qty_with_value(element_name, element_value)
  else
    cart_page.set_element_with_value(element_name, element_value)
  end
end

And(/^user clear cart_page$/) do
  cart_page.clear_cart_page
end

And(/^user can see order_total_value on cart_page$/) do
  if VN_AllPage.isVenus?
    VN_CartPage.check_order_total
  end
end

And(/^user fill offer_code_field with offer_code on cart_page$/) do
  if VN_AllPage.isVenus?
    VN_CartPage.fill_offer_code_field_with_offer_code
  end
end


And(/^user can see applied_offer_code on cart_page$/) do
  if VN_AllPage.isVenus?
    VN_CartPage.check_applied_offer_code
  end
end

And(/^user click returns_content on shipping_and_delivery_page$/) do
  REV_CartPage.click_returns_link
end

Then(/^user can see "([^"]*)" on returns_content_page$/) do |arg|
  REV_CartPage.expect_returns_content
end

And(/^user remember "([^"]*)" on cart_page$/) do |content_to_remember|
  cart_page.remember_content(content_to_remember)
end

Then(/^user can not see "([^"]*)" on cart_page$/) do |content_name|
  cart_page.expect_no_content(content_name)
end

Then(/^user can see "([^"]*)" on shipping_and_delivery_page$/) do |content_name| #refactor
  REV_CartPage.expect_content(content_name)
end