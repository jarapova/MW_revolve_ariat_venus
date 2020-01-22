Feature: This test suite declines My Bag Page functionality for Venus

Add random item to cart as logged user ================================================================ Ready for dev
Add random items to cart as guest user ================================================================ Ready for dev
See expected content on cart page ===================================================================== Ready for dev
Proceed to checkout button works as expected ========================================================== Ready for dev
See expected content for added items on cart page ===================================================== Ready for dev
Change item qty on cart page ========================================================================== Ready for dev
Remove item from cart ================================================================================= Ready for dev
Estimated total price calculating ===================================================================== Ready for dev
See expected content on empty cart page =============================================================== Ready for dev
Offer code ============================================================================================ Ready for dev


  #Proceed to checkout 1 button works as expected
  Scenario: As user I want proceed to checkout using 1st Proceed to checkout button
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    Then user click "checkout_btn_1" on cart_page
    And user can see "checkout_page_content" on checkout_page

    #Proceed to checkout 2 button works as expected
  Scenario: As user I want proceed to checkout using 2nd Proceed to checkout button
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    Then user click add_to_bag_button on product_page
    And user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    Then user click "checkout_btn_2" on cart_page
    And user can see "checkout_page_content" on checkout_page

  #Change item qty on cart page
  Scenario: As user I want change item qty on cart page
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    Then user set "1_item_qty" with value "1" on cart_page



  #Remove item from cart
  Scenario: As user I want remove item from cart
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click view_bag_button on add_to_bag_popup
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    And user clear cart_page



  #Estimated total price calculating
  Scenario: As user I want see correct estimated total price
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    And user can see order_total_value on cart_page

  #See expected content on empty cart page
  Scenario: As user I want see expected content on empty cart page
    Given user is on home_page
    Then user click cart_icon on header
    Then user can see "cart_page_content" on cart_page


    #Offer code
  Scenario: As guest user I want proceed to checkout using checkout as guest button
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    And user click add_to_bag_button on product_page
    Then user click cart_icon on header
    And user can see "cart_page_content" on cart_page
    And user can see "test_item_1_hash" on cart_page
    And user fill offer_code_field with offer_code on cart_page
    And user click "apply_button" on cart_page
    And user can see applied_offer_code on cart_page


#
#  #See expected content on cart page
#  Scenario: As user I want see expected content on cart page
#    Given user is on home_page
#    When user click cart_icon on header
#    And user is on cart_page
#    And user clear items in cart list
#    Then user is on PLP page
#    And user click "random_item_image" on subcategory_page
#    And user is on pdp_page
#    Then user selects random item size
#    And user click add_to_bag_button on product_page
#    And user click continue_shopping button on popup
#    Then user is on PLP page
#    And user click "random_item_image" on subcategory_page
#    And user is on pdp_page
#    Then user selects random item size
#    And user click add_to_bag_button on product_page
#    Then user click view_bag on popup
#    And user is on cart_page
#    And user can see subtotal count on top and bottom of cart page
#    And user can see total price on top and bottom of cart page


    #See expected content for added items on cart page
#  Scenario: As user I want see expected content for added items on cart page
#    Given user is on home_page
#    When user click cart_icon on header
#    And user is on cart_page
#    And user clear items in cart list
#    Then user is on PLP page
#    And user click "random_item_image" on subcategory_page
#    And user is on pdp_page
#    Then user selects random item size
#    And user click add_to_bag_button on product_page
#    And user click continue_shopping button on popup
#    Then user is on PLP page
#    And user click "random_item_image" on subcategory_page
#    And user is on pdp_page
#    Then user selects random item size
#    And user click add_to_bag_button on product_page
#    Then user click view_bag on popup
#    And user is on cart_page
#    Then guest user can see "product name" on cart_page
#    And guest user can see "product ID" on cart_page
#    And guest user can see "product size" on cart_page
#    And guest user can see "product color" on cart_page
#    And guest user can see "product price" on cart_page
#    And guest user can see "product qty" on cart_page