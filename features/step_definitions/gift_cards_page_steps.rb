Then(/^user can see "([^"]*)" on gift_cards_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_GiftCardsPage.expect_content_on_gift_cards_page(content_name_to_check)
  end
end