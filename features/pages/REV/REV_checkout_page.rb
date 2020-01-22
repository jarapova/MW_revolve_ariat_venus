# In this module we collecting methods for checkout page of REVOLVE
require 'capybara/cucumber'


module REV_CheckoutPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.expect_content(content_name)
    if content_name == 'guest_checkout_page_content'
      check_guest_checkout
    elsif content_name == 'checkout_content'
      check_user_checkout_content
    end
  end

  def self.check_guest_checkout
    guest_checkout_locators = rev_get_checkout_page_content['delivery_guest_locators']
    guest_checkout_locators.each do |name, locator|
      page.assert_selector(:xpath, locator, visible: true)
      p "I see #{name} on guest checkout page"
    end
  end

  def self.check_user_checkout_content
    close_update_card_modal
    checkout_header_locators = rev_get_checkout_page_content['checkout_header_locators']
    checkout_header_locators.each do |name, locator|
      page.assert_selector(:xpath, locator)
      p "I see #{name} on checkout page"
    end
    active_tab_text = find(:xpath, "//*[@class='co_header_active']").text
    p "I am on #{active_tab_text} checkout_page"
    case active_tab_text.downcase
    when "delivery"
      p "delivery"
      locators = rev_get_checkout_page_content['delivery_locators']
    when "payment"
      p "payment"
      locators = rev_get_checkout_page_content['payment_locators']
    when "review & confirm"
      p "review & confirm"
      locators = rev_get_checkout_page_content['review_and_confirm_locators']
    end
    locators.each do |name, locator|
      page.assert_selector(:xpath ,locator)
      p "I see #{name} on #{active_tab_text}"
    end
  end

  def self.close_update_card_modal
    if page.has_selector?(:xpath, "//*[contains(text() ,'RE-ENTER YOUR CARD NUMBER')]")
      p "I see modal"
      find(:xpath, "//*[contains(@class, 'modal__close')]").click
      sleep 3
      p "Modal is closed"
    else
      p "I don't see modal"
    end
  end

end