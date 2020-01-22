And(/^user can see "([^"]*)" on size_chart_page$/) do |arg|
  if VN_AllPage.isVenus?
    page.assert_selector(:xpath,"//h3[text()='PERFECT FIT CONTEMPORARY SIZING:']")
    p "I am on size chart page"
  end
end

When(/^user click "([^"]*)" on size_chart_page$/) do |element_name|
  VN_ProductPage.click_element_on_size_chart(element_name)
end