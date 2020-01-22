home_page = Object
if AN_AllPage.isAnnie?
  home_page = AN_HomePage
elsif ST_AllPage.isStage?
  home_page = ST_HomePage
elsif VN_AllPage.isVenus?
  home_page = VN_HomePage
elsif REV_AllPage.isRevolve?
  home_page = REV_HomePage
elsif SCP_AllPage.is_SCP?
  home_page = SCP_HomePage
elsif ARI_AllPage.is_ARI?
  home_page = ARI_HomePage
end

Given(/^user is on home_page$/) do
  home_page.visit_home_page
end

And(/^user can see main_navigation_carousel on header$/) do
  home_page.expect_main_navigation_carousel
end

Then(/^user can see "([^"]*)" on home_page$/) do |homepage_content_name|
  home_page.expect_content(homepage_content_name)
end

When(/^click plus_button on home_page$/) do
  home_page.click_plus_button
end

Then(/^user can see plus_button on home_page$/) do
  home_page.expect_plus_button
end

Then(/^user can see email_subscription_field on home_page$/) do
  home_page.expect_email_subscription_field
end

Then(/^user click email_subscription_field on home_page$/) do
  home_page.click_email_subscription_field
end

Then(/^user fill email_subscription_field with "([^"]*)" on home_page$/) do |value|
  home_page.fill_email_subscription_field(value)
end

Then(/^user click email_subscription_field_arrow_button on home_page$/) do
  home_page.email_subscription_field_arrow_button_click
end


And(/^user click "([^"]*)" on home_page$/) do |element_to_click|
  home_page.click_element(element_to_click)
end

Given(/^user is on revolve_mens_page$/) do
  home_page.visit_mens_page
end

Given(/^user is on revolve_womens_page$/) do
  home_page.visit_womens_page
end

And(/^user can see "([^"]*)" on recently_viewed_section$/) do |item_name|
  home_page.expect_recently_viewed_parameters(item_name)
end

Then(/^user click "([^"]*)" on category_panel$/) do |category_name|
  home_page.click_navigation_panel_category(category_name)
end

Then(/^user make email subscription on sign_in_pop_up$/) do
  home_page.make_email_subscription
end

Then(/^user can not see "([^"]*)" on home_page$/) do |content_name|
  home_page.expect_no_content(content_name)
end