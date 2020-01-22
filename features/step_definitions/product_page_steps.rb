product_page = Object

if VN_AllPage.isVenus?
  product_page = VN_ProductPage
elsif AN_AllPage.isAnnie?
  product_page = AN_ProductPage
elsif ST_AllPage.isStage?
  product_page = ST_ProductPage
elsif REV_AllPage.isRevolve?
  product_page = REV_ProductPage
elsif SCP_AllPage.is_SCP?
  product_page = SCP_ProductPage
elsif ARI_AllPage.is_ARI?
  product_page = ARI_ProductPage
end

And(/^user click add_to_bag_button on product_page$/) do
  product_page.click_element('add_to_bag_button')
end

Given(/^user is on pdp_page$/) do
  product_page.expect_pdp_page
end

And(/^user set "([^"]*)" with value "([^"]*)" on product_page$/) do |element_name, element_value|
  if VN_AllPage.isVenus?
    VN_ProductPage.set_item_qty_with_value(element_name, element_value)
  end
end

And(/^user can see "([^"]*)" on product_page$/) do |content_name_to_check|
  product_page.expect_content(content_name_to_check)
end

Given(/^user is on "([^"]*)" product_page$/) do |item_id|
  product_page.go_to_pdp(item_id)
end

And(/^user click view_bag_button on add_to_bag_popup$/) do
  product_page.click_view_bag_popup
end

Then(/^user can see main_product_image on product_page$/) do
  product_page.expect_main_product_image
end

When(/^user click "([^"]*)" from item_image_galary on product_page$/) do |image_index|
  if VN_AllPage.isVenus?
    VN_ProductPage.click_all_images_from_gallery
  end
end

Then(/^user can see main_product_image_zoomed on product_page$/) do
  product_page.expect_zoomed_image
end

And(/^user click close_zoomed_image on product_page$/) do
  if VN_AllPage.isVenus?
  VN_ProductPage.click_close_zoomed_image_on_pdp
  end
end

And(/^user click image_zoom_button on product_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.click_image_zoom_button
  elsif REV_AllPage.isRevolve?
    REV_ProductPage.click_image_zoom_button
  end
end

And(/^user can see zoomed_image_closed on product_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.expect_zoomed_image_closed_on_pdp
  end
end

Then(/^user click "([^"]*)" on product_page$/) do |element_name|
  product_page.click_element(element_name)
end

Then(/^user can see "([^"]*)" with value "([^"]*)" on product_page$/) do |element_name, element_value|
  product_page.expect_element_with_value(element_name, element_value)
end

And(/^user remember "([^"]*)" product parameters on product_page$/) do |test_item|
  product_page.remember_item_parameters(test_item)
end


And(/^user remember "([^"]*)" complete the look parameters on product_page$/) do |test_item|
  if VN_AllPage.isVenus?
    VN_ProductPage.remember_complete_the_look_test_item(test_item)
  end
end

And(/^user click "([^"]*)" on breadcrumb$/) do |piece_name|
  product_page.click_breadcrumb(piece_name)
end

Then(/^user click "([^"]*)" on zoom_modal_window$/) do |zoomed_element|
  if REV_AllPage.isRevolve?
    zoomed_element.sub!('image_', '')
    REV_ProductPage.click_zoomed_image(zoomed_element.to_i)
  end
end

And(/^user can see "([^"]*)" on zoom_modal_window$/) do |zoomed_element|
  product_page.expect_content(zoomed_element)
end

Then(/^user can see "([^"]*)" on size_and_fit_modal$/) do |content_name|
  product_page.expect_size_and_fit_modal(content_name)
end

And(/^user remember "([^"]*)" on product_page$/) do |element_name|
  product_page.remember_item_element(element_name)
end

Then(/^user can not see "([^"]*)" on product_page$/) do |content_name|
  product_page.expect_no_content(content_name)
end