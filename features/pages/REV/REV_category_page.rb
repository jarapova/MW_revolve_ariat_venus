# In this module we collecting methods for category page of REVOLVE
require 'capybara/cucumber'


module REV_CategoryPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.set_gift_certificate_price(price_value)
    find(:xpath, "//*[@id='prodSelect']").click
    sleep 1
    find(:xpath, "//*[@id='prodSelect']//option[text()='$#{price_value.to_s}']").click
    p "I set gift certificate price #{price_value}"
  end

  def self.set_gift_recipient_emails
    email = generate_email
    find(:xpath, "//input[@id='recipientEmail']").set(email)
    find(:xpath, "//input[@id='confirmEmail']").set(email)
    $revolve_stored_information['gift_email'] = email
  end

  def self.set_gift_delivery_method(method_name)
    find(:xpath, "//*[@id='methodSelect']").click
    find(:xpath, "//*[@id='methodSelect']//option[text()='#{camel_case(method_name)}']").click
  end

  def self.set_gift_message
    message = "The machines rose from the ashes of the nuclear fire."
    find(:xpath, "//textarea[@id='msgbox']").set(message)
    $revolve_stored_information['gift_message'] = message
  end

  def self.set_element_with_value(element_name, value)
    if element_name == 'gift_price'
      set_gift_certificate_price(value)
    elsif element_name == 'gift_delivery_method'
      set_gift_delivery_method(value)
    end
  end

  def self.fill_element(element_name)
    if element_name == 'gift_email_fields'
      set_gift_recipient_emails
    elsif element_name == 'gift_message'
      set_gift_message
    end
  end

  def self.click_element(element_name)
    if element_name == 'gift_add_to_bag_button'
      find(:xpath, "//*[text()='ADD TO BAG']").click
      p "I clicked gift certificate add to bag button"
    end
  end

  def self.expect_customer_care_pages_content(content_name)
    locators = rev_get_customer_care_pages_content[content_name]
    ta_locator_prefix = "revolve:customer_care:" + content_name + ":"
    p content_name
    locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(ta_locator_prefix + name, locator))
      p "I see #{name} on customer care page"
    end
  end

  def self.click_designer(designer_name)
    find(:xpath, %{//a[contains(text(), "#{designer_name}")]}).click
    p "I clicked #{designer_name}"
  end

end