And(/^user can see "([^"]*)" on privacy_policy_page$/) do|content_name_to_check|
  if VN_AllPage.isVenus?
    VN_PrivacyPolicyPage.expect_content_on_privacy_policy_page(content_name_to_check)
  end
end

