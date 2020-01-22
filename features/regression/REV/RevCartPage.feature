Feature: This test suite declines My Bag Page functionality for Revolve

  Add random item to cart as logged user ================================================================ Ready for dev
  Add random items to cart as guest user ================================================================ Ready for dev
  See expected content on cart page ===================================================================== Ready for dev
  Proceed to checkout button works as expected ========================================================== Ready for dev
  See expected content for added items on cart page ===================================================== Ready for dev
  Change item size on cart page ========================================================================= Ready for dev
  Change item qty on cart page ========================================================================== Ready for dev
  Save for later functionality ========================================================================== Ready for dev
  Remove item from cart ================================================================================= Ready for dev
  Estimated total price calculating ===================================================================== Ready for dev
  Proceed to paypal checkout button ===================================================================== Ready for dev
  Navigating from bottom to top of cart page using arrow button ========================================= Ready for dev
  See expected content on empty cart page =============================================================== Ready for dev
  Shop womens on empty cart page ======================================================================== Ready for dev
  Shop mens on empty cart page ========================================================================== Ready for dev
  Сheckout as guest button ============================================================================== Ready for dev
  Sign in for faster checkout button ==================================================================== Ready for dev
  Shipping options info ================================================================================= Ready for dev
  Sign in using sign in message ========================================================================= Ready for dev
  Afterpay information on cart page ===================================================================== Ready for dev






  #Add random items to cart as guest user
  Scenario: As guest user I want add random item to cart
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page


  #See expected content on cart page
  Scenario: As user I want see expected content on cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user can see subtotal count on top and bottom of cart page
    And user can see total price on top and bottom of cart page

  #Proceed to checkout button works as expected
  Scenario: As user I want proceed to checkout using Proceed to checkout button
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    Then user clicks on proceed to checkout button in cart
    And user on checkout page

  #See expected content for added items on cart page
  Scenario: As user I want see expected content for added items on cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    Then user can see product "name" for item in cart
    And user can see product "brand" for item in cart
    And user can see product "style" for item in cart
    And user can see product "color" for item in cart
    And user can see product "price" for item in cart
    And user can see product size in cart
    And user can see product qty in cart

  #Change item size on cart page
  Scenario: As user I want change item size on cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user can see product size in cart
    Then user chose random size for random item in cart
    And user can see size updated message
    And user can see that size was changed for expected item in cart

  #Change item qty on cart page
  Scenario: As user I want change item qty on cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user can see product qty in cart
    Then user chose random qty for random item in cart
    And user can see size updated message
    And user can see that qty was changed for expected item in cart

  #Save for later functionality
  Scenario: As user I want use save for later functionality
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    Then user click on save for later for random product
    And user can see saved for later message
    And user can see expected item in saved for later block
    Then user click logo_button on header
    And user click cart_icon on header
    And user is on cart_page
    And user can see expected item in saved for later block
    Then user click on move to bag for saved item
    And user can see moved to bag message
    And There is no saved for later block
    Then user click logo_button on header
    And user click cart_icon on header
    And user is on cart_page
    And There is no saved for later block
    Then user click on save for later for random product
    And user can see saved for later message
    And user can see expected item in saved for later block
    And user click remove for saved item
    And user can see removed from saved message
    And There is no expected item in cart
    And There is no saved for later block
    Then user click logo_button on header
    And user click cart_icon on header
    And user is on cart_page
    And There is no expected item in cart
    And There is no saved for later block


  #Remove item from cart
  Scenario: As user I want remove item from cart
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    Then user click on remove for random product
    And user can see removed from bag message


  #Estimated total price calculating
  Scenario: As user I want see correct estimated total price
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user can see total price on top and bottom of cart page
    And estimated total price is correct


  #Proceed to paypal checkout button
  Scenario: As user I want proceed to paypal checkout using Proceed to paypal checkout button
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    Then user click on paypal button on cart page
    And user is on paypal checkout page

  #Navigating from bottom to top of cart page using arrow button
  Scenario: As user I want navigate from bottom to top of cart page using arrow button
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    Then user scrolls to the bottom of cart page
    And press on go to top arrow button
    And user is on top of cart page

  #See expected content on empty cart page
  Scenario: As user I want see expected content on empty cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user can see empty shopping cart banner
    And user can see start shopping message on cart page
    And user can see shop "womens button" on cart page
    And user can see shop "mens button" on cart page

  #Shop womens on empty cart page
  Scenario: As user I want use shop womens button on empty cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user click "shop womens" button on cart page
    And user is on "womens new arrivals" page

  #Shop mens on empty cart page
  Scenario: As user I want use shop mens button on empty cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user click "shop mens" button on cart page
    And user is on "mens new arrivals" page

    #Checkout as guest button
  Scenario: As guest user I want proceed to checkout using checkout as guest button
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user clicks on checkout as guest button on cart page
    Then user on checkout page


    #Sign in for faster checkout button
  Scenario: As guest user I want sign in using sign in for faster checkout button
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user clicks on sign in for faster checkout button
    Then user on sign_in_page


    #Shipping options info
  Scenario: As guest user I want navigate to shipping options page from cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user clicks on shipping options in cart
    Then user is on "shipping options" page



    #Sign in using sign in message
  Scenario: As guest user I want sign in using sign in to sync your bag... message
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user can see sign in message in the cart bottom
    And user clicks on sign in link in sign in message
    Then user on sign_in_page



    #Afterpay information on cart page
  Scenario: As guest user I want see afterpay information on cart page
    Given: user is on home_page
    When user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    And user click continue_shopping button on popup
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user clicks on afterpay info
    Then user can see afterpay info modal
    And user close afterpay info modal



     #Add random item to cart as logged user
  Scenario: As logged user I want add random item to cart
    Given: user is on home_page
    When user is logged in as "user1"
    And user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user is on PLP page
    And user click "random_item_image" on subcategory_page
    And user is on pdp_page
    Then user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user can see expected item in cart
