search_modal_page = Object

if VN_AllPage.isVenus?
  search_modal_page = VN_SearchModalPage
elsif AN_AllPage.isAnnie?
  search_modal_page = AN_SearchModalPage
elsif ST_AllPage.isStage?
  search_modal_page = ST_SearchModalPage
elsif REV_AllPage.isRevolve?
  search_modal_page = REV_SearchModalPage
elsif SCP_AllPage.is_SCP?
  search_modal_page = SCP_HeaderPage
elsif ARI_AllPage.is_ARI?
  search_modal_page = ARI_HeaderPage
end

And(/^user fill search_field with value "([^"]*)" on search_modal$/) do |search_text|
  search_modal_page.search_modal_type_term(search_text)
end

And(/^user can see suggested_search on search_modal$/) do
  search_modal_page.expect_suggested_search
end

And(/^user click "([^"]*)" suggested_search on search_modal$/) do |arg|
  search_modal_page.click_random_suggested_search
end

And(/^user click search_button on search_modal$/) do
  search_modal_page.click_search_btn
end

And(/^user can see search_modal_content on search_modal$/) do
  search_modal_page.expect_search_modal
end


Then(/^user can see "([^"]*)" on search_modal$/) do |content_name_to_check|
  search_modal_page.expect_content(content_name_to_check)
end

And(/user close search_modal$/) do
  search_modal_page.close_search_modal
end

Then(/^user can see "([^"]*)" on search_results_page$/) do |content_name_to_check|
  search_modal_page.expect_search_results_page(content_name_to_check)
end

And(/^user click "([^"]*)" on search_results_page$/) do |item_to_click|
  search_modal_page.click_item_image_on_search_results_page(item_to_click)
end

And(/user can see items count on search_result_page$/) do
  search_modal_page.check_items_count_on_search_results_page
end

Then(/^user select "([^"]*)" from subcategory_filter on search_result_page$/) do |arg|
  search_modal_page.select_subcategory_from_filter_on_search_result_page(arg)
end

And(/user can see items count on search_result_page with applied filter$/) do
  search_modal_page.check_items_count_with_applied_filter_on_search_results_page
end

And(/current items count become less or equal with filter applied on search_result_page$/) do
  search_modal_page.expect_correct_items_count_with_applied_filter_on_search_results_page
end

And(/^user click "([^"]*)" on search_modal$/) do |element_name|
  if VN_AllPage.isVenus?
    VN_SearchModalPage.random_suggest_click
  else
    search_modal_page.click_suggested_search(element_name)
  end
end