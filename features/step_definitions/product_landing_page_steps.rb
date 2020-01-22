Then(/^user can see "([^"]*)" on product_landing_page$/) do |content_name|
  VN_ProductLandingPage.expect_content(content_name)
end

When(/^user click "([^"]*)" on product_landing_page$/) do |element_name|
  VN_ProductLandingPage.click_element(element_name)
end

Then(/^user can see "([^"]*)" with value "([^"]*)" on product_landing_page$/) do |element_name, expected_value|
  VN_ProductLandingPage.expect_element_with_value(element_name, expected_value)
end

When(/^user is on product_landing_page$/) do
  VN_ProductLandingPage.switch_url_to_landing_page
end