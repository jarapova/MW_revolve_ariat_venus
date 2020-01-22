Then(/^user can see "([^"]*)" on third_party_page$/) do |content_name|
  VN_FooterModalPage.check_third_party_content(content_name)
end