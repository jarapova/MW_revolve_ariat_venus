checkout_page = Object
if VN_AllPage.isVenus?
  checkout_page = VN_CheckoutPage
elsif REV_AllPage.isRevolve?
  checkout_page = REV_CheckoutPage
elsif ARI_AllPage.is_ARI?
  checkout_page = ARI_CheckoutPage
end

And(/^user can see "([^"]*)" on checkout_page$/) do  |content_name_to_check|
  checkout_page.expect_content(content_name_to_check)
end