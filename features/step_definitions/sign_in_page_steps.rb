sign_in_page = Object

if VN_AllPage.isVenus?
  sign_in_page = VN_SignInPage
elsif AN_AllPage.isAnnie?
  sign_in_page = AN_SignInPage
elsif REV_AllPage.isRevolve?
  sign_in_page = REV_SignInPage
elsif SCP_AllPage.is_SCP?
  sign_in_page = SCP_SignInPage
elsif ARI_AllPage.is_ARI?
  sign_in_page = ARI_SignInPage
end

Given(/^user make login as "([^"]*)"$/) do |user_id|
  sign_in_page.make_login_as(user_id)
end

When(/^user can see "([^"]*)" on sign_in_page$/) do |content_name_to_check|
  sign_in_page.expect_content(content_name_to_check)
end

When(/^user click "([^"]*)" on sign_in_page$/) do |element_name_to_click|
  sign_in_page.click_element(element_name_to_click)
end


And(/^user click cancel_button on password_lookup_modal$/) do
  sign_in_page.click_cancel_forgot_password_modal
end

Then(/^user click "([^"]*)" on sign_in_modal$/) do |sign_in_element|
  REV_ProductListingPage.click_modal_window(sign_in_element)
end