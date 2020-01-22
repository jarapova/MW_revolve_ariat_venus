And(/^user can see "([^"]*)" on sitemap_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_SitemapPage.expect_content_on_sitemap_page(content_name_to_check)
  end
end