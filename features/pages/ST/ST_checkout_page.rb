# In this module we collecting methods for checkout page of ST
require 'capybara/cucumber'


module ST_CheckoutPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.change_item_qty
    page.assert_selector(:xpath, "//h2[@class='cart__count']")
    items_count=find_all(:xpath, "//section[@class='cart-item__info']").count
    if items_count>1
    page.assert_selector(:xpath, "//p[@class='cart__header__id']")
    cart_id = find(:xpath, "//p[@class='cart__header__id']").text
    p cart_id
    option = Random.rand(1..20)
    # select(option, :from => '(//select[@name="cart-item-1-quantity"])[1]')
    # select(option, :from => 'item-3293000090-quantity')
    find(:xpath, '(//select[@name="cart-item-1-quantity"])[1]').click
    find(:xpath, "(//select[@name='cart-item-1-quantity'])[1]/option[#{option}]").click
    elsif
      p  "no items in cart"
    end
    ST_AllPage.close_all_banners
  end
end