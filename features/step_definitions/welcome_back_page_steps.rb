And(/^user can see "([^"]*)" on welcome_back_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_WelcomeBackPage.expect_content_on_welcome_back_page(content_name_to_check)
  end
end