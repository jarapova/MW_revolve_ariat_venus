account_page = Object
if VN_AllPage.isVenus?
  account_page = VN_AccountPage
elsif SCP_AllPage.is_SCP?
  account_page = SCP_AccountPage
elsif REV_AllPage.isRevolve?
  account_page = REV_AccountPage
end

And(/^user can see "([^"]*)" on account_information_page$/) do |content_name_to_check|
  account_page.expect_content(content_name_to_check)
end

And(/^user click "([^"]*)" on account_information_page$/) do |element_name_to_click|
  account_page.click_element(element_name_to_click)
end

And(/^user can see "([^"]*)" on order_history_page$/) do |content_name_to_check|
  account_page.expect_content_on_order_history_page(content_name_to_check)
end

And(/^user can see "([^"]*)" on mail_options_page$/) do |content_name_to_check|
  account_page.expect_content_on_mail_options_page(content_name_to_check)
end


When(/^user click "([^"]*)" on account_navigation_tab$/) do |element_name_to_click|
  account_page.click_element_account_navigation_tab(element_name_to_click)
end

And(/^user can see "([^"]*)" on wish_list_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_AccountPage.expect_cart_page_content(content_name_to_check)
  elsif REV_AllPage.isRevolve?
    REV_AccountPage.expect_content(content_name_to_check)
  end
end

And(/^user clear wish_list_page/) do
  account_page.clear_wish_list_page
end

And(/^user click "([^"]*)" on wish_list_page$/) do |favorites_element|
  if VN_AllPage.isVenus?
    VN_AccountPage.click_move_to_bag_item(favorites_element)
  elsif REV_AllPage.isRevolve?
    REV_AccountPage.click_element_favorites_page(favorites_element)
  end
end

When(/^user click sign_in_button on wish_list_page$/) do
  REV_AccountPage.click_sign_in_on_wish_list_page
end