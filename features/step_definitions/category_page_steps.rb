category_page = Object
if VN_AllPage.isVenus?
  category_page = VN_CategoryPage
elsif AN_AllPage.isAnnie?
  category_page = AN_CategoryPage
elsif REV_AllPage.isRevolve?
  category_page = REV_CategoryPage
end

And(/^user select random_subcategory from subcategory_filter on category_page$/) do
  category_page.select_random_filter_subcategory
end

Then(/^user is on "([^"]*)" category page$/) do |arg|
  category_page.expect_category_page_for(arg)
end

And(/^user select "([^"]*)" from subcategory_filter on category_page$/) do |subcategory_name|
  category_page.select_subcategory_from_filter(subcategory_name)
end

And(/^user click "([^"]*)" on category_page$/) do |element_name|
  if VN_AllPage.isVenus?
    VN_CategoryPage.click_random_product(element_name)
  else REV_AllPage.isRevolve?
    category_page.click_element(element_name)
  end
end

Then(/^user can see "([^"]*)" on category_page$/) do |content_name_to_check|
  category_page.expect_content(content_name_to_check)
end

Then(/^user can see "([^"]*)" on hot_list_page$/) do |hot_list_content|
  REV_HomePage.expect_content(hot_list_content)
end

And(/^user click "([^"]*)" on brand_page$/) do |designer_name|
  category_page.click_designer(designer_name)
end

And(/^user can see "([^"]*)" on brand_page$/) do |content_name|
  REV_ProductListingPage.expect_content(content_name)
end

And(/^user set "([^"]*)" with value "([^"]*)" on category_page$/) do |element_name, value|
  category_page.set_element_with_value(element_name, value)
end

Then(/^user fill "([^"]*)" on category_page$/) do |element_name|
  category_page.fill_element(element_name)
end

When(/^user click subcategory_filter on category_page$/) do
  category_page.click_category_filter
end