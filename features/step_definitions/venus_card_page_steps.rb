Then(/^user can see "([^"]*)" on venus_card_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_VenusCardPage.expect_content_on_venus_card_page(content_name_to_check)
  end
end