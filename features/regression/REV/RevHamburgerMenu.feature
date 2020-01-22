Feature: This test suite defines the Hamburger Menu functionality for Revolve


  Hamburger Menu flow:

  User can open and close Hamburger Menu ========================================= Ready for dev
  User can navigate to category page through Hamburger Menu ====================== Ready for dev
  User can navigate to subcategory page and see subcategory remain after click === Ready for dev
  User can navigate to All New Items category page through Hamburger Menu ======== Ready for dev
  User can navigate to Random Daily New Items page through Hamburger Menu ======== Ready for dev
  User is able to reach Account page from hamburger menu ========================= Ready for dev
  User should see "Sign in" page on Order History link while logged out ========== Ready for dev
  User should see "Order History" page on Order History link while logged in ===== Ready for dev
  User can navigate to "My Favorites" page through Hamburger Menu ================ Ready for dev
  User can navigate to "Contact Us" page through Hamburger Menu ================== Ready for dev
  User can navigate to "Shipping & Delivery" page through Hamburger Menu ========= Ready for dev
  User can navigate to "Returns & Exchanges" page through Hamburger Menu ========= Ready for dev
  User can view the desktop site through the Hamburger Menu ====================== Ready for dev


# User can open and close Hamburger Menu =========================================== Ready for dev =====================
  Scenario: As user I want to open and close the Hamburger Menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    Then user click hamburger_menu_icon on header
    And user can see "home_page_content" on home_page

# User can navigate to category page through Hamburger Menu ======================== Ready for dev =====================
  Scenario: As user I want to navigate to the category page through the Hamburger Menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "Womens" on hamburger_menu
    And user click "Dresses" on hamburger_menu
    And user click "Gowns" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Gowns" on subcategory_page

# User can navigate to subcategory page and see subcategory remain after click ===== Ready for dev =====================
  Scenario: As user I want to navigate through subcategories in Hamburger Menu and reopen to see same subcategory
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "Mens" on hamburger_menu
    And user click "Shoes" on hamburger_menu
    And user click "Sneakers" on hamburger_menu
    And user click "Athletic" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "Athletic" on subcategory_page
    When user click hamburger_menu_icon on header
    And user can see "subcategory_header" with value "Sneakers" on hamburger_menu
    And user can see "second_subcategory" on hamburger_menu

# User can navigate to All New Items category page through Hamburger Menu ========== Ready for dev =====================
  Scenario: As user I want to navigate to the All New Items subcategory page through the Hamburger Menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user can see "hamburger_first_page_content" on hamburger_menu
    And user click "Womens" on hamburger_menu
    And user click "New Arrivals" on hamburger_menu
    And user click "All New Items" on hamburger_menu
    Then user can see "product_list_page_content" on subcategory_page
    And user can see "main_text" with value "All New Items" on subcategory_page

# User is able to reach Account page from hamburger menu =========================== Ready for dev =====================
  #Not done
  #Feature is not working
  Scenario: As user and guest I want to reach account page from hamburger menu
    Given user is on home_page
    And user make login as "user1"
    And user click hamburger_menu_icon on header
    Then user is able to see account tab
    Then user click on accordion "My Settings"
    And user click on subcategory "Account Settings"
    And user is on "Account Settings" page
    Then user click logo_button on header
    And user click hamburger_menu_icon on header
    Then user is able to see account tab
    Then user click on accordion "My Settings"
    And user click on subcategory "Email Preferences"
    And user is on "Email Preferences" page
    Then user click logo_button on header
    And user click hamburger_menu_icon on header
    Then user is able to see account tab
    Then user click on accordion "My Settings"
    And user click on subcategory "Shipping Address"
    And user is on "Shipping Address" page
    Then user click logo_button on header
    And user click hamburger_menu_icon on header
    Then user is able to see account tab
    Then user click on accordion "My Settings"
    And user click on subcategory "Billing Information"
    And user is on "Billing Information" page
    Then user click on Logout in the top of hamburger menu
    And user click on Login in the top of hamburger menu
    Then user on sign_in_page

# User should see "Sign in" page on Order History link while logged out ========= Ready for dev ========================
  #Not done
  #Feature is not working
  Scenario: As a guest user, I should see the sign in page when accessing the Order History link in the Hamburger Menu
    Given user is on home_page
    And user make login as "user1"
    When user click hamburger_menu_icon on header
    And user click "Order History" category
    Then user is on "Order History" page

# User should see "Order History" page on Order History link while logged in ==== Ready for dev ========================
  #Not done
  #Feature is not working
  Scenario: As a signed in user, I should see order history page when accessing the Order History link in Hamburger Menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Order History" category
    Then user on sign_in_page

# User can navigate to "My Favorites" page through Hamburger Menu =============== Ready for dev ========================
  #Not done
  #Feature is not working
  Scenario: As user I want to navigate to "My Favorites" page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "My Revolve" on hamburger_menu
    And user click "My Favorites" on hamburger_menu
#    Then user is on "My Favorites" page

# User can navigate to "Contact Us" page through Hamburger Menu ================= Ready for dev ========================
  #Not done
  #Feature is not working
  Scenario: As user I want to navigate to "Contact Us" page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Customer Care" category
    Then user is on "Contact Us" page

    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Contact Us" category
    Then user is on "Contact Us" page

    # Note: There are two ways to get to the "Contact Us" page; "Customer Care" and "Contact Us" links

# User can navigate to "Shipping & Delivery" page through Hamburger Menu =========== Ready for dev =====================
  #Not done
  #Feature is not working
  Scenario: As user I want to navigate to "Customer Care" page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Shipping & Delivery" category
    Then user is on "Shipping & Delivery" page

# User can navigate to "Returns & Exchanges" page through Hamburger Menu =========== Ready for dev =====================
  #Not done
  #Feature is not working
  Scenario: As user I want to navigate to "Returns & Exchanges" page
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user click "Returns & Exchanges" category
    Then user is on "Returns & Exchanges" page

# User can view the desktop site through the Hamburger Menu ======================== Ready for dev =====================
  #Not done
  #Feature is not working
  Scenario: As user I want to view the desktop site on mobile, through the Hamburger Menu
    Given user is on home_page
    When user click hamburger_menu_icon on header
    And user clicks on "Switch to Desktop Version" link in the footer of the Hamburger menu
    Then user is on the Desktop site