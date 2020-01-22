Then(/^user can see "([^"]*)" on request_a_catalog_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_RequestCatalogPage.expect_content_on_request_catalog_page(content_name_to_check)
  end
end