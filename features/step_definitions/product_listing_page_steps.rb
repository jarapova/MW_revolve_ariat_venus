product_listing_page = Object

if VN_AllPage.isVenus?
  product_listing_page = VN_ProductListingPage
elsif REV_AllPage.isRevolve?
  product_listing_page = REV_ProductListingPage
elsif ST_AllPage.isStage?
  product_listing_page = ST_CategoryPage
elsif SCP_AllPage.is_SCP?
  product_listing_page = SCP_ProductListPage
elsif ARI_AllPage.is_ARI?
  product_listing_page = ARI_ProductListPage
end

And(/^user click subcategory_filter on subcategory_page$/) do
  product_listing_page.click_subcategory_filter
end

And(/^user can see "([^"]*)" on subcategory_page$/) do |content_name_to_check|
  product_listing_page.expect_content(content_name_to_check)
end

And(/^user click item_parameters_filter on subcategory_page$/) do
  product_listing_page.click_parameters_filter
end

And(/^user expand parameters on item_parameters_filter_popup$/) do
  product_listing_page.open_parameters_filter_dropdowns
end

And(/^user click "([^"]*)" from subcategory_filter on subcategory_page$/) do |subcategory_name|
  product_listing_page.click_subcategory_from_filter(subcategory_name)
end

And(/^user click close_item_parameters_filter on subcategory_page$/) do
  product_listing_page.close_parameters_filter
end


And(/^user click "([^"]*)" on subcategory_page$/) do |item_to_click|
  product_listing_page.click_element(item_to_click)
end

And(/^user can see price_with_sale on subcategory_page$/) do
  product_listing_page.check_price_with_sale_subcategory_page
end

Then(/^user click size_filter_button on subcategory_page$/) do
  product_listing_page.open_size_filter
end

And(/^user select "([^"]*)" from filter_popup on subcategory_page$/) do |arg|
  product_listing_page.select_random_size_filter_option
end

And(/^user click view_results_button on filter_popup$/) do
  product_listing_page.click_view_filter_results
end


And(/^user can see current_items_count become less or equal on subcategory_page$/) do
  product_listing_page.check_current_items_become_less_or_equal
end

And(/^user can see current_items_count on subcategory_page$/) do
  product_listing_page.update_items_count
end

And(/^user click clear_filter_button on filter_popup$/) do
  product_listing_page.clear_all_filters
end

And(/^user can see current_items_count become equal on subcategory_page$/) do
  product_listing_page.check_items_count_equal
end

And(/^user can see subcategory_filter_button with value "([^"]*)" on subcategory_page$/) do |expected_value|
  product_listing_page.check_filter_button_value(expected_value)
end

And(/^user remember items_count on subcategory_page$/) do
  product_listing_page.remember_items_count_on_plp
end

And(/^user click close_sort_button on filter_popup$/) do
  product_listing_page.click_close_sort_button
end

And(/^user click close_filter_button on filter_popup$/) do
  product_listing_page.click_close_filter_button
end

And(/^user can see "([^"]*)" with value "([^"]*)" on subcategory_page$/) do |base_element, expected_text|
  product_listing_page.check_base_element_with_value(base_element, expected_text)
end

Then(/^user click sort_button on subcategory_page$/) do
  product_listing_page.click_sort_button
end

And(/^user click close_popup_button on sort_popup$/) do
  product_listing_page.click_close_sort_button
end

And(/^user click "([^"]*)" on filter_popup$/) do |filter_category|
  product_listing_page.click_filter_category(filter_category)
end

And(/^user select "([^"]*)" on filter_accordion$/) do |filter_accordion_option|
  product_listing_page.select_filter_accordion_category(filter_accordion_option)
end

Then(/^user can see "([^"]*)" on filter_popup$/) do |content_name|
  product_listing_page.expect_filter_content(content_name)
end

And(/^user can see "([^"]*)" in range from "([^"]*)" to "([^"]*)" on subcategory_page$/) do |element,
    start_value,
    end_value|
  product_listing_page.expect_filter_price_in_range(start_value, end_value)
end

And(/^user remember plp_items_names on subcategory_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductListingPage.remember_items_parameters
  elsif REV_AllPage.isRevolve?
    REV_ProductListingPage.remember_content("items_names")
  else
    product_listing_page.remember_items_names
  end
end

Then(/^user can not see "([^"]*)" on subcategory_page$/) do |content_name|
  product_listing_page.expect_no_content(content_name)
end

When(/^user click "([^"]*)" on filter_widget$/) do |element_name|
  product_listing_page.click_filter_widget_element(element_name)
end

And(/^user is on product_list_page$/) do
  if ST_AllPage.isStage?
    ST_CategoryPage.visit_plp
  end
end

And(/^user select "([^"]*)" from sort_dropdown on product_list_page$/) do |category|
  product_listing_page.click_sort_category(category)
end

And(/^user click close_dropdown_button on sort_dropdown$/) do
  product_listing_page.click_close_sort_button
end

Then(/^user click filter_button on subcategory_page$/) do
  product_listing_page.click_filter_button
end

And(/^user click "([^"]*)" on filter_dropdown$/) do |filter_category|
  product_listing_page.click_filter_category("Designer")
end

And(/^user click view_results_button on filter_dropdown$/) do
  product_listing_page.click_view_filter_results
end

Given(/^user is on "([^"]*)" subcategory_page$/) do |page_name|
  product_listing_page.navigate_to_page(page_name)
end