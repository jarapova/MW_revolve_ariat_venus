header_page = Object

if VN_AllPage.isVenus?
  header_page = VN_HeaderPage
elsif ST_AllPage.isStage?
  header_page = ST_HeaderPage
elsif AN_AllPage.isAnnie?
  header_page = AN_HeaderPage
elsif REV_AllPage.isRevolve?
  header_page = REV_HeaderPage
elsif SCP_AllPage.is_SCP?
  header_page = SCP_HeaderPage
elsif ARI_AllPage.is_ARI?
  header_page = ARI_HeaderPage
end


Given(/^user click hamburger_menu_icon on header$/) do
  header_page.click_element('hamburger_icon')
end

And(/^user click cart_icon on header$/) do
  header_page.click_element('cart_icon')
end

Then(/^user click logo_button on header$/) do
  header_page.click_element("logo_button")
end

Then(/^user click "([^"]*)" on main_navigation_carousel$/) do |carousel_element_name|
  header_page.navigate_to_category_from_carousel(carousel_element_name)
end

Then(/^user click my_account_icon on header$/) do
  header_page.my_account_icon_click
end

Then(/^user can see "([^"]*)" on header$/) do |content_name_to_check|
  header_page.expect_content(content_name_to_check)
end

Then(/^user click "([^"]*)" on account_modal on header$/) do |element_name_to_click|
  header_page.click_element_on_header_account_modal(element_name_to_click)
end

When(/^user click "([^"]*)" on header$/) do |element_name|
  header_page.click_element(element_name)
end

Then(/^user can see "([^"]*)" with value "([^"]*)" on header$/) do |element_name, element_value|
  header_page.expect_element_with_value(element_name, element_value)
end

And(/^user click "([^"]*)" on dropdown_menu$/) do |category_name|
  header_page.click_category_dropdown(category_name)
end

And(/^user fill "([^"]*)" with value "([^"]*)" on closest_store_modal$/) do |element, value|
  header_page.set_element_with_value(element, value)
end

When(/^user can see "([^"]*)" on closest_store_modal$/) do |content_name|
  SCP_HeaderPage.expect_content(content_name)
end

And(/^user click "([^"]*)" on closest_store_modal$/) do |store_element|
  SCP_HeaderPage.click_closest_store(store_element)
end

And(/^user remember "([^"]*)" on closest_store_modal$/) do |element_name|
  SCP_HeaderPage.remember_closest_store_content(element_name)
end

Then(/^user can not see "([^"]*)" on header$/) do |content_name|
  header_page.expect_no_content(content_name)
end

Given(/^user click search_icon on header$/) do
  header_page.click_element('search_icon')
end