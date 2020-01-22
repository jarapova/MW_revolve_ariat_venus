contact_us_page = Object
if VN_AllPage.isVenus?
  contact_us_page = VN_ContactUsPage
end

Then(/^user can see "([^"]*)" on contact_us_page$/) do |content_name_to_check|
  contact_us_page.expect_content_on_contact_us_page(content_name_to_check)
end