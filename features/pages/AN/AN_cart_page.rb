# In this module we are collecting methods for the cart page of ANNIE SELKE
require 'capybara/cucumber'

module AN_CartPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.add_item_to_cart(test_item_url_item)
    visit AN_TESTITEM_URL[test_item_url_item.to_i]
    an_close_email_popup
    p  "The email pop-up is now closed"
    p  "I want to add item to cart"
    p  "Item parameters are:"
    AN_ProductPage.an_get_product_parameters_pdp_page
    find(:xpath, "//div[@data-page='Product']/div/div/div/button/span[contains(., 'Add to Cart')]").click
    p  "I've clicked Add to Cart. I need to select a size."
    find(:xpath, "//div[h2/text() = 'Select size']/div[1]").click
    added_item_size = find(:xpath, "//div[h2/text() = 'Select size']/div[1]").text.tr('0123456789$,.', '').delete!("\n")
    p  "I've selected the #{added_item_size} size"
    expect(page).to have_selector(:xpath,"//button/span[contains(., 'View Cart')]")
    items_in_cart = find(:xpath, "//button[contains(@aria-label, 'Cart')]/span/div[2]").text
    items_in_cart
    p  "There are currently #{items_in_cart} item(s) in the cart"
    expect(items_in_cart.to_i).to  be > 0
    p  "Verified that the cart is not empty, as expected"
  end
  def self.click_checkout
    expect(page).to have_selector(:xpath,"//button/span[contains(., 'CHECKOUT')]")
    find(:xpath,"//button/span[contains(., 'CHECKOUT')]").click
    p  "I've clicked the checkout button"
    expect(page).to have_selector(:xpath,"//body[contains(@class, 'checkout')]")
    p  "I am on the checkout page"
  end
end
