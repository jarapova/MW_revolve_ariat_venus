#Projects:
#@proj:united

Feature: As traveler I want to use Cart edit my traveler details


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] Users should see cart page when clicking "edit cart" on payment page of check-in
    Given that the payment page is displayed
    When "edit cart" is selected
    Then display the cart modal

  @proj:united
  Scenario:[United] Users should see save button disabled when on "edit cart" modal with no changes made
    Given that the "edit cart" modal is displayed
    When no changes have been made
    Then the saved button should appear in a disabled greyed-out state

  @proj:united
  Scenario:[United] Users should see save button enabled on "edit cart" modal when changes made
    Given that the "edit cart" modal is displayed
    When changes have been made
    Then the save button will display as an enabled purple button as shown in comp

  @proj:united
  Scenario:[United] Users should see changes discarded when cancel button is clicked on "edit cart" modal
    Given that the "edit cart" modal is displayed
    When "cancel" is selected
    Then all changes should be canceled and the modal will close

  @proj:united
  Scenario:[United] Users should see "edit cart" modal when "Edit Cart" is clicked on payment page
    Given that the "edit cart" modal is displayed
    When the "edit" button is selected
    Then the

  @proj:united
  Scenario:[United] Users should see card turn blue on "Edit Cart" page when "remove" button is clicked
    Given that the "edit cart" modal is displayed
    When the "remove" button is selected
    Then the applicable card should turn blue with the overlay text, as shown in comp

  @proj:united
  Scenario:[United] Users can remove items on "Edit Cart" page when "remove" button is clicked
    Given that the "remove" button was selected
    And the card has turned blue
    When "Yes remove" is selected
    Then the card should disappear and the remaining purchases should remain in the cart with the adjusted price

  @proj:united
  Scenario:[United] Users can cancel removing items from "Edit Cart" page when "Cancel" button is clicked
    Given that the "remove" button was selected
    And the card has turned blue
    When "cancel" is selected
    Then the card should return to its original format

  @proj:united
  Scenario:[United] Users can save changes on "Edit Cart" page when "Save" button is clicked
    Given that changes have been made in the edit cart modal
    When the "save" is selected
    Then the modal will close

  @proj:united
  Scenario:[United] Users can view updated payment costs on purchase summary page after changes submitted on cart page
    Given that the payment screen is displayed
    When changes have been made to the cart
    Then display the updated payment cost under purchase summary

  @proj:united
  Scenario:[United] Users can successfully remove items from cart on Payment page
    Given that the payment screen is displayed
    When changes have been made to the cart
    Then display the card "You’ve successfully removed "blank" from your cart.

  @proj:united
  Scenario:[United] Users can return to "check bags" page from Payment page
    Given that the payment screen is displayed
    When "back" is selected
    Then the application will proceed to the previous screen "check bags"

  @proj:united
  Scenario:[United] Users can reach "Boarding Pass" page by clicking "Purchase and complete check-in" on Payment page
    Given that the payment screen is displayed
    When "Purchase and complete check-in" is selected
    Then the application will proceed to the next screen "boarding pass"
