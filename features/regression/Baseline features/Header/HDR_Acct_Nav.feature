#Projects:
#@proj:venus
#@proj:shoecarnival

Feature: As a customer, I can click on the account icon on header to see account navigation links
  HDR - Account - Navigation

  [Venus] is showing account navigation links
  [Shoe] As a customer, I can click on the account icon to view my account details or see the login/signup page.
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


    @proj:baseline
  Scenario:[Baseline] Signed in user can click on the account icon and see modal with account navigation links
    Given test steps are under design

    @proj:baseline
  Scenario:[Baseline] Guest user suggested to sign-in after taping account icon in header
    Given test steps are under design

    @proj:baseline
  Scenario:[Baseline] Signed in user can click on the account icon and navigate to Account info form modal with account navigation links
    Given test steps are under design

    @proj:baseline
  Scenario:[Baseline] Signed in user can click on the account icon and navigate to Order history form modal with account navigation links
    Given test steps are under design

    @proj:baseline
  Scenario:[Baseline] Signed in user can click on the account icon and navigate to Mail options form modal with account navigation links
    Given test steps are under design

    @proj:baseline
  Scenario:[Baseline] Signed in user can click on the account icon and navigate to Wish list form modal with account navigation links
    Given test steps are under design

    @proj:baseline
  Scenario:[Baseline] Signed in user can click on the account icon and make logout form modal with account navigation links
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

    @proj:venus @automated
  Scenario:[Venus] Signed in user can click on the account icon and see modal with account navigation links
    Given user make login as "user1"
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header

    @proj:venus @automated
  Scenario:[Venus] Guest user suggested to sign-in after taping account icon in header
    Given user is on home_page
    When user click my_account_icon on header
    Then user can see "sign_in_page_content" on sign_in_page

    @proj:venus @automated
  Scenario:[Venus] Signed in user can click on the account icon and navigate to Account info form modal with account navigation links
    Given user make login as "user1"
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "account_info" on account_modal on header
    And user can see "account_information_page_content" on account_information_page

    @proj:venus @automated
  Scenario:[Venus] Signed in user can click on the account icon and navigate to Order history form modal with account navigation links
    Given user make login as "user1"
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "order_history" on account_modal on header
    And user can see "order_history_page_content" on order_history_page

    @proj:venus @automated
  Scenario:[Venus] Signed in user can click on the account icon and navigate to Mail options form modal with account navigation links
    Given user make login as "user1"
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "mail_options" on account_modal on header
    And user can see "mail_options_page_content" on mail_options_page

    @proj:venus @automated
  Scenario:[Venus] Signed in user can click on the account icon and navigate to Wish list form modal with account navigation links
    Given user make login as "user1"
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "wish_list" on account_modal on header
    And user can see "wish_list_page_content" on wish_list_page

    @proj:venus @automated
  Scenario:[Venus] Signed in user can click on the account icon and make logout form modal with account navigation links
    Given user make login as "user1"
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "log_out" on account_modal on header
    Then user can see "sign_in_page_content" on sign_in_page

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] [SCP-14] User click on the account icon to view my account details or see the login/signup page. Depends on signed-in status.
    Given user is on home_page
    When user click "account_icon" on header
    Then user can see "sign_in_page_content" on sign_in_page
    When user make login as "user1"
    And user is on home_page
    And user click "account_icon" on header
    Then user can see "account_page_content" on account_information_page


  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] After a user is logged in, the account icon should be linked to /account page
    Given user is on home_page

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] Account icon should only have /myaccount page if the user is not logged in
    Given user is on home_page

  @proj:shoecarnival @automated
  Scenario:[ShoeCarnival] Make sure logged-in users cookie and cache not splitting on different devices
    Cache splitting issue: user make login and his account should not be logged in on other devices in network.
    Issue was: After Log in, all devices in the same network become logged in
    Given user is on home_page
