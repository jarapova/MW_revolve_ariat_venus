And(/^user can see "([^"]*)" on terms_of_use_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_TermsOfUsePage.expect_content_on_terms_of_use_page(content_name_to_check)
  end
end
