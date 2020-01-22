# In this module we collecting methods for OrderStatus  page of VN
require 'capybara/cucumber'




module VN_OrderStatusPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def  self.expect_content_on_order_status_page(content_name_to_check)
    if content_name_to_check == 'order_status_guest_page_content'
      page.assert_selector(:xpath, "//*[@id='ctl00_Body1_loginemail']")
      page.assert_selector(:xpath, "//*[@id='ctl00_Body1_loginpassword']")
      p  "I am on login page as expected. As order status page is only for signed in user."
    end
  end
end