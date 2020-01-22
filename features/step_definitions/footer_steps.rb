footer_page = Object
if VN_AllPage.isVenus?
  footer_page = VN_FooterModalPage
elsif REV_AllPage.isRevolve?
  footer_page = REV_FooterPage
elsif ARI_AllPage.is_ARI?
  footer_page = ARI_FooterPage
end

And(/^user can see "([^"]*)" on footer$/) do |content_name_to_check|
  footer_page.expect_content(content_name_to_check)
end

And(/^user click "([^"]*)" on footer$/) do |element_name_to_click|
  footer_page.click_element(element_name_to_click)
end


And(/^user set "([^"]*)" with value "([^"]*)" on footer$/) do |element_name, element_value|
  footer_page.set_element_with_value(element_name, element_value)
end

Then(/^user can see "([^"]*)" with value "([^"]*)" on footer$/) do |element_name, element_value|
  footer_page.expect_element_with_value(element_name, element_value)
end