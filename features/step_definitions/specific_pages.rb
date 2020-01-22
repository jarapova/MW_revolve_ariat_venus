And(/^user click "([^"]*)" on shop_by_color_page$/) do |element_name|
  VN_CategoryPage.click_shop_by_color(element_name)
end