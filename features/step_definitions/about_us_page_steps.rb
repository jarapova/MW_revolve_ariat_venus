about_us_page = Object
if VN_AllPage.isVenus?
  about_us_page = VN_AboutUsPage
end

Then(/^user can see "([^"]*)" on about_us_page$/) do |content_name_to_check|
  about_us_page.expect_content_on_about_us_page(content_name_to_check)
end