Then(/^user can see "([^"]*)" on order_status_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_OrderStatusPage.expect_content_on_order_status_page(content_name_to_check)
  end
end