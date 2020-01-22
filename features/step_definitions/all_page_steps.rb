all_page = Object
if REV_AllPage.isRevolve?
  all_page = REV_AllPage
elsif SCP_AllPage.is_SCP?
  all_page = SCP_AllPage
elsif VN_AllPage.isVenus?
  all_page = VN_AllPage
elsif ARI_AllPage.is_ARI?
  all_page = ARI_AllPage
end

And(/^user is on "([^"]*)" page$/) do |page_name|
  VN_AllPage.visit_page(page_name)
  my_set_cookie('smartbanner-closed', 'true')
  my_set_cookie('ConsentToCookies', 'true')
end

And(/^user close all banners$/) do
  all_page.close_all_banners
end

And(/^User makes test loop to check cart coockies merging 1$/) do
  if ST_AllPage.isStage?
    (1...2).each {
      arg = "woomen shirts"
      ST_SearchModalPage.open_search_modal
      ST_SearchModalPage.search_modal_type_term(arg)
      ST_SearchModalPage.click_search_btn
      ST_SearchModalPage.expect_search_results
      ST_NavigationPage.select_random_item
      ST_AllPage.close_all_banners
      ST_HeaderPage.cart_icon_click
      ST_CheckoutPage.change_item_qty
      ST_ProductPage.get_cart_info_1
      ST_HomePage.visit_home_page
    }
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^User makes test loop to check cart coockies merging 2$/) do
  if ST_AllPage.isStage?
    (1...2).each {
      arg = "woomen shirts"
      ST_SearchModalPage.open_search_modal
      ST_SearchModalPage.search_modal_type_term(arg)
      ST_SearchModalPage.click_search_btn
      ST_SearchModalPage.expect_search_results
      ST_NavigationPage.select_random_item
      ST_AllPage.close_all_banners
      ST_HeaderPage.cart_icon_click
      ST_CheckoutPage.change_item_qty
      ST_ProductPage.get_cart_info_2
      ST_HomePage.visit_home_page
    }
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/user wait "([^"]*)" sec$/) do |duration|
  VN_AllPage.wait(duration)
end

Given(/^test steps are under design$/) do
  pending
end

Then(/^user scroll to the bottom of page$/) do
  scroll_to_bottom
end

And(/^user can see arrow_button on page$/) do
  all_page.expect_arrow_button
end

Then(/^user click arrow_button on page$/) do
  all_page.click_arrow_button
end

And(/^user can see "([^"]*)" on page$/) do |content_name|
  all_page.expect_content(content_name)
end

And(/^user scroll page$/) do
  scroll_page
end

And(/^user update page$/) do
  update_page
end

And(/^user remember page_url on page$/) do
  all_page.remember_current_url
end

Then(/^user can not see "([^"]*)" on page$/) do |content_name|
  all_page.expect_no_content(content_name)
end

And(/^user click "([^"]*)" on page$/) do |element_name|
  all_page.click_element(element_name)
end