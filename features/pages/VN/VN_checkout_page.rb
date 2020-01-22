# In this module we collecting methods for checkout page of VN
require 'capybara/cucumber'


module VN_CheckoutPage
  extend Capybara::DSL
  extend RSpec::Matchers

 def self.expect_content(content_name_to_check)
   if content_name_to_check == 'checkout_page_content'
     if page.has_xpath?("//div[text()='Guest Checkout' and contains (@class, 'mw-tb-header mw-active')]")
      VN_CheckoutPage.expect_content_guest_checkout_page
     elsif
     page.has_xpath?("//div[text()='Sign In' and contains (@class, 'mw-tb-header mw-active')]")
      VN_CheckoutPage.expect_content_sign_in_checkout_page
     elsif
     page.has_xpath?("//div[text()='Shipping' and contains (@class, 'mw-pb-step mw-progress-shipping mw-active')]")
      VN_CheckoutPage.expect_content_shipping_checkout_page
     elsif
     page.has_xpath?("//div[text()='Billing' and contains (@class, 'mw-pb-step mw-progress-billing mw-active')]")
      VN_CheckoutPage.expect_content_billing_checkout_page
     elsif
     page.has_xpath?("//div[text()='Preview' and contains (@class, 'mw-pb-step mw-progress-review mw-active')]")
      VN_CheckoutPage.expect_content_preview_checkout_page
     end
   end
 end

  def self.expect_content_guest_checkout_page
    p "It is a Guest checkout page"
    locators_to_check_on_page = vn_get_guest_checkout_page_locators
    locators_to_check_on_page.each do |(name, locator)|
      page.assert_selector(:xpath, locator)
      p  "I see #{name} element on checkout page"
      end
  end

  def self.expect_content_sign_in_checkout_page
    p "It is a Sign in checkout page"
    locators_to_check_on_page = vn_get_sign_in_checkout_page_locators
    locators_to_check_on_page.each do |(name, locator)|
      page.assert_selector(:xpath, locator)
      p  "I see #{name} element on checkout page"
    end
  end

  def self.expect_content_shipping_checkout_page
    p "It is a Shipping checkout page"
    locators_to_check_on_page = vn_get_shipping_checkout_page_locators
    locators_to_check_on_page.each do |(name, locator)|
      page.assert_selector(:xpath, locator)
      p  "I see #{name} element on checkout page"
    end
  end
  def self.expect_content_billing_checkout_page
    p "It is a Billing checkout page"
    locators_to_check_on_page = vn_get_billing_checkout_page_locators
    locators_to_check_on_page.each do |(name, locator)|
      page.assert_selector(:xpath, locator)
      p  "I see #{name} element on checkout page"
    end
  end
  def self.expect_content_preview_checkout_page
    p "It is a Preview checkout page"
    locators_to_check_on_page = vn_get_preview_checkout_page_locators
    locators_to_check_on_page.each do |(name, locator)|
      page.assert_selector(:xpath, locator)
      p  "I see #{name} element on checkout page"
    end
  end

  end