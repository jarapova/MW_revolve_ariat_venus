#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a logged in customer, I should be able to sync items in the cart across all devices
  Shopping Cart - Item Sync

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Logged in user see the same products list in cart across all devices he logged in
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user see the same products list in cart across all devices he logged in (Checkout login)
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] When Shopping bag was merged, user should see 'Your shopping bag has been updated' message
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] As a guest user, I should see added to cart items are still in my basket for 14 days

  @proj:baseline
  Scenario:[Baseline] Logged in user see the same products list in cart across all devices he logged in on mobile APP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user see the same products list in cart across all devices he logged in (Checkout login) on mobile APP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user see the same products list in cart across all devices he logged in on mobile APP and PWA
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Logged in user see the same products list in cart across all devices he logged in (Checkout login) on mobile APP and PWA
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] When Shopping bag was merged, user should see 'Your shopping bag has been updated' message on mobile APP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] As a guest user, I should see added to cart items are still in my basket for 14 days on mobile APP

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] Logged in user see the same products list in cart across all devices he logged in
    Given test steps are under design


#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus] Logged in user see the same products list in cart across all devices he logged in
    Given Logged in user adds items to their bag on Device 1
    When The user begins shopping on Device 2
    And User make log in immediately
    Then User can see that Shopping bag on Device 2 was updated with all items that were added from the session on Device 1
    And when user views their bag,  he can see 'Your shopping bag has been updated'message
    And user can see that device 2's bag items and quantities are match device 1 bag items and quantities.

  @proj:venus @manual
  Scenario:[Venus] Logged in user see the same products list in cart across all devices he logged in (Checkout login)
    Given Logged in user adds items to bag on Device 1
    When user add item1 to bag on Device 1
    Then user then begins shopping on Device 2 and adds items to bag
    And user add item1 to bag on Device 2
    Then user begins to check out
    And user make log in on the first step of checkout
    And user can see that shopping bag should now include items from both sessions on Device 1 and Device 2.
    And user can see item1 in cart page with qty = 2

  @proj:venus @manual
  Scenario:[Venus] When Shopping bag was merged, user should see 'Your shopping bag has been updated' message
    Given Logged in user adds items to their bag on Device 1
    When The user begins shopping on Device 2
    And User make log in immediately
    Then User can see that Shopping bag on Device 2 was updated with all items that were added from the session on Device 1
    Then when user views their bag,  he can see 'Your shopping bag has been updated'message
    And this message appears only 1 time, for no more than 5 seconds, and can be dismissed via 'Okay, got it"

  @proj:venus
  Scenario:[Venus] As a guest user, I should see added to cart items are still in my basket for 14 days
  Venus to remember me/my site behavior for 14 days even if I do not have an account yet
    Given test steps are under design

  @proj:venus @manual
  Scenario:[Venus] Logged in user see the same products list in cart across all devices he logged in on mobile APP
    Given Logged in user adds items to their bag on Device 1 using Mobile app
    When The user begins shopping on Device 2 using Mobile app
    And User make log in immediately
    Then User can see that Shopping bag on Device 2 was updated with all items that were added from the session on Device 1
    And when user views their bag,  he can see 'Your shopping bag has been updated'message
    And user can see that device 2's bag items and quantities are match device 1 bag items and quantities.

  @proj:venus @manual
  Scenario:[Venus] Logged in user see the same products list in cart across all devices he logged in (Checkout login) on mobile APP
    Given Logged in user adds items to bag on Device 1 using Mobile app
    When user add item1 to bag on Device 1
    Then user then begins shopping on Device 2 using Mobile app and adds items to bag
    And user add item1 to bag on Device 2
    Then user begins to check out
    And user make log in on the first step of checkout
    And user can see that shopping bag should now include items from both sessions on Device 1 and Device 2.
    And user can see item1 in cart page with qty = 2

  @proj:venus @manual
  Scenario:[Venus] Logged in user see the same products list in cart across all devices he logged in on mobile APP and PWA
    Given Logged in user adds items to their bag on Device 1 using Mobile app
    When The user begins shopping on Device 2 using PWA
    And User make log in immediately
    Then User can see that Shopping bag on Device 2 was updated with all items that were added from the session on Device 1
    And when user views their bag,  he can see 'Your shopping bag has been updated'message
    And user can see that device 2's bag items and quantities are match device 1 bag items and quantities.

  @proj:venus @manual
  Scenario:[Venus] Logged in user see the same products list in cart across all devices he logged in (Checkout login) on mobile APP and PWA
    Given Logged in user adds items to bag on Device 1 using PWA
    When user add item1 to bag on Device 1
    Then user then begins shopping on Device 2 using Mobile app and adds items to bag
    And user add item1 to bag on Device 2
    Then user begins to check out
    And user make log in on the first step of checkout
    And user can see that shopping bag should now include items from both sessions on Device 1 and Device 2.
    And user can see item1 in cart page with qty = 2

  @proj:venus @manual
  Scenario:[Venus] When Shopping bag was merged, user should see 'Your shopping bag has been updated' message on mobile APP
    Given Logged in user adds items to their bag on Device 1 using Mobile app
    When The user begins shopping on Device 2 using Mobile app
    And User make log in immediately
    Then User can see that Shopping bag on Device 2 was updated with all items that were added from the session on Device 1
    Then when user views their bag,  he can see 'Your shopping bag has been updated'message
    And this message appears only 1 time, for no more than 5 seconds, and can be dismissed via 'Okay, got it" on Mobile app

  @proj:venus @manual
  Scenario:[Venus] As a guest user, I should see added to cart items are still in my basket for 14 days on mobile APP
  Venus to remember me/my site behavior for 14 days even if I do not have an account yet on mobile APP
    Given test steps are under design

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @manual
  Scenario:[Stagestores] Logged in user see the same products list in cart across all devices he logged in
    Given test steps are under design


     @proj:stagestores @manual
  Scenario:[Stagestores]  I need to make sure my cookie session is captured & retrieved so it knows I have been on the site before
     Adding a product to the shopping bag, then exiting the webpage
     Return to Shoe Carnival’s website and still seeing the product in the shopping bag
    Given test steps are under design


