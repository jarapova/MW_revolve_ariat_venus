Feature: This test suite declines Account page functionality for Venus

  #  Log in
  Scenario: As user I can login to account using my credentials
    Given user is on home_page
    When user make login as "user1"

  #  Log out
  Scenario: As logged in User I want to click "Log out" in account icon popup and be logged out
    Given user make login as "user1"
    Then user click "logout_button" on account_information_page
    Then user can see "sign_in_page_content" on sign_in_page

    #Navigation between accounts tab
  Scenario: User able to switch between accounts tab
    Given user make login as "user1"
    And user can see "welcome_back_account_page_content" on account_information_page
    Then user click "order_history" on account_navigation_tab
    And user can see "order_history_page_content" on order_history_page
    Then user click "wish_list" on account_navigation_tab
    And user can see "wish_list_page_content" on wish_list_page
    Then user click "mail_options" on account_navigation_tab
    Then user can see "mail_options_page_content" on mail_options_page
    And user click "account_info" on account_navigation_tab
    And user can see "account_information_page_content" on account_information_page


 # Add item to wishlist
  Scenario: As user I want to add item to wishlist
    Given user make login as "user1"
    Then user click "account_info" on account_navigation_tab
    And user can see "account_information_page_content" on account_information_page
    Then user click "wish_list" on account_navigation_tab
    And user can see "wish_list_page_content" on wish_list_page
    And user clear wish_list_page
    Given user is on "item_1" product_page
    And user scroll page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    Then user click "add_to_wish_list" on product_page
    And user can see "test_item_1_hash" on wish_list_page

 #Account tabs in account modal
  Scenario: As Logged in user I can select account icon in header and can navigate to each option from popup
    Given user make login as "user1"
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "order_history" on account_modal on header
    And user can see "order_history_page_content" on order_history_page
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "mail_options" on account_modal on header
    And user can see "mail_options_page_content" on mail_options_page
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "wish_list" on account_modal on header
    And user can see "wish_list_page_content" on wish_list_page
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "account_info" on account_modal on header
    And user can see "account_information_page_content" on account_information_page
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "log_out" on account_modal on header
    Then user can see "sign_in_page_content" on sign_in_page


#    #  Add item to cart from wish list
#  Scenario: As user I want to add item to wish list. As user I want to move items to bag from wish list
#    Given user is logged in as "user1"
#    And user can see main_navigation_carousel on header
#    And user click "Clothing" on main_navigation_carousel
#    And user select "Dresses" from subcategory_filter on category_page
#    And user click "random_item_image" on subcategory_page
#    And user is on pdp_page
#    And user click "available_size_button" on product_page
#    Then user set "product_qty" with value "2" on product_page
#    When user adding "$item1" to wish list
#    Then user see added "$item1" in wish list
#    Then user adding "$item1" to bag from wishlist
#
#  #  Add all item to cart from wish list
#  Scenario: As user I want to move all wishlist items to bag
#    Given user is logged in as "user1"
#    Given user is on wishlist page
#    And user clicks Move all items to bag


     #Forgot password
  Scenario: As user I want to use forgot password function
    Given user is on home_page
    When user click my_account_icon on header
    Then user can see "sign_in_page_content" on sign_in_page
    Then user click "forgot_password_link" on sign_in_page
    And user can see "password_lookup_content" on sign_in_page
    And user click cancel_button on password_lookup_modal
    And user can see "sign_in_page_content" on sign_in_page
#    Then user on sign_in_page
#    Then user click forget_password on sign_in_page
#    And user can see password_lookup_modal on sign_in_page
#    And user click click_here_link on password_lookup_modal
#    Then user on sign_in_page
#    Then user click forget_password on sign_in_page
#    And user can see password_lookup_modal on sign_in_page
#    Then user enter valid "user1" email
#    And user click lookup_password on password_lookup_modal
#    Then user can see that password has been emailed

 #Create account - already have an account
#  Scenario: Already have an account takes user to sign in page
#    Given user is on home_page
#    When user click my_account_icon on header
#    Then user can see "sign_in_page_content" on sign_in_page
#    Then user click "create_account_button" on sign_in_page
#    #ToDo step below:
#    And user click already have an account
#    Then user on sign_in_page

  ##  Go to account and edit some field
#  Scenario: As User I want to edit "ACCOUNT INFO" data (Go to account and edit all field)
#    Given user is logged in as "user1"
#    When a modal with account options displayed
#    And user can navigate to "Account Info" option from account modal
#    Then user can add address info to Account Info page using "user2" personal data
#    And user can add address info to Account Info page using "user1" personal data

##  Go to account and edit mail options
#  Scenario: As Existing User I want to add and change "MAILING OPTIONS"
#    Given user is logged in as "user1"
#    When a modal with account options displayed
#    And user can navigate to "Mail Options" option from account modal
#    Then user able to change mailing settings in Mail option account page

##  Create account
#  Scenario: As Guest user I want to create account using my email
#    Given user is on home_page
#    Then user selects “My account” icon in header
#    When the user selects Create Account button
##TODO    refactor bellow user creation step after venus can approve temp email registration
#    Then user able to create new account using "new_user" personal data


  # #Wish List - Remove item
#  Scenario: As user I want remove item from wishlist
#    Given user is logged in as "user1"
#    And user is on wishlist page
#    #ToDo steps below:
#    Then user click remove for random item in wishlist
#    And user see message that item was removed
#    And there is no removed item in wishlist

# #Wish List - Change item qty
#  Scenario: As user I want change qty for item in wishlist
#    Given user is logged in as "user1"
#    And user is on wishlist page
#    #ToDo steps below:
#    Then user set random qty for random item in wishlist
#    And user see that qty for random item in wishlist was changed


# #Wish List - Open PDP
#  Scenario: As user I want open PDP of item from wishlist
#    Given user is logged in as "user1"
#    And user is on wishlist page
#    #ToDo steps below:
#    Then user click on random item image in wishlist
#    And user is on expected PDP


# #Wish List - Update item
#  Scenario: As user I want update item in wishlist
#    Given user is logged in as "user1"
#    And user is on wishlist page
#    #ToDo steps below:
#    Then user click update on random item in wishlist
#    And item was updated

# #Wish List - Public/Private
#  Scenario: As user I want change wish list visibility to public or private
#    Given user is logged in as "user1"
#    And user is on wishlist page
#    #ToDo 2 steps below:
#    And user can see all items in wishlist
#    And user select private option for wishlist
#    Then user make Log Out from account icon popup
#    Then user see "RETURNING CUSTOMERS" title
#    And user is logged in as "user3"
#    And user is on wishlist page
#    #ToDo 2 steps below:
#    Then user search for "user1" wishlist
#    And user see that no wishlists were found
#    Then user make Log Out from account icon popup
#    Then user is logged in as "user1"
#    And user is on wishlist page
#    And user can see all items in wishlist
#    #ToDo step below:
#    And user select public option for wishlist
#    Then user make Log Out from account icon popup
#    Then user see "RETURNING CUSTOMERS" title
#    And user is logged in as "user3"
#    And user is on wishlist page
#    Then user search for "user1" wishlist
#    #ToDo step below:
#    And user can see items from user1 wishlist


# #Wish List - Find friends wish list
#  Scenario: As user I want to find friends wish list
#    Given user is logged in as "user1"
#    And user is on wishlist page
#    And user can see all items in wishlist
#    And user select public option for wishlist
#    Then user make Log Out from account icon popup
#    Then user see "RETURNING CUSTOMERS" title
#    And user is logged in as "user3"
#    And user is on wishlist page
#    Then user search for "user1" wishlist
#    And user can see items from user1 wishlist

  # #Order history
#  Scenario: Order history page have expected content
#    Given user make login as "user1"
#    And user click logo_button on header
#    When a modal with account options displayed
#    And user can navigate to "Order History" option from account modal
#    And user is on "Order History" page
#    #ToDo step below:
#    Then user can see expected info for each order

# #Order history - View order details
#  Scenario: As user I want to view order details by click on "View order details" or click on order number
#    Given user is logged in as "user1"
#    And user click logo_button on header
#    When a modal with account options displayed
#    And user can navigate to "Order History" option from account modal
#    And user is on "Order History" page
#    #ToDo 3 steps below:
#    And user click on random order number
#    Then user is on order detail page
#    And user can see expected order info
#    And user click logo_button on header
#    When a modal with account options displayed
#    And user can navigate to "Order History" option from account modal
#    And user is on "Order History" page
#    #ToDo step below:
#    And user click on random view details
#    Then user is on order detail page
#    And user can see expected order info