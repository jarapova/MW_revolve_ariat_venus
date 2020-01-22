#Projects:
#@proj:united

Feature: As traveler I want to use Customize or edit my traveler details


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can see Baggage page after "Customize flight" page by clicking "No thanks" button
    Given that "customize" is displayed
    When "No thanks" is selected
    Then the application will proceed to the next screen: "Check bags"

  @proj:united
  Scenario:[United] User can see Reservation page from "Customize flight" page by clicking "Back" button
    Given that "customize" is displayed
    When "back" is selected
    Then the application will proceed to the previous screen "Your reservation"

  @proj:united
  Scenario:[United] User can see Upgrade Options modal from "Customize flight" page by clicking "Customize" button
    Given that "customize" is displayed
    When "view upgrade options" card is selected
    Then the upgrade modal will open

  @proj:united
  Scenario:[United] User can access Premier Access modal from "Customize flight" page by selecting "view purchase options" card
    Given that "customize" is displayed
    When "view purchase options" card is selected
    Then the Premier Access modal will open

  @proj:united
  Scenario:[United] User can access seat map from "Customize flight" page by clicking "Select Seats" card
    Given that "customize" is displayed
    When "select seats" card is selected
    Then the Economy Plus modal will open

  @proj:united
  Scenario:[United] User can see new price and "Continue" button after selecting option on "Customize flight" page
    Given that a user has proceeded through the modal and picked an option
    When they have returned to the customize screen
    Then the screen should indicate the new price in the footer and the forward button should say "continue"

  @proj:united
  Scenario:[United] User can return to Customize screen from "Customize flight" page by proceeding through modal with no options selected
    Given that a user has proceeded through the modal and did not pick an option
    When they have returned to the customize screen
    Then the screen should remain the same

  @proj:united
  Scenario:[United] User can open cart modal when cost total displayed in footer on "Customize Flight" page
    Given that the user has a cost total in the footer
    When the user selects "edit cart"
    Then the cart modal will open

  @proj:united
  Scenario:[United] User can open "Edit card payment details" modal from "Customize Flight" page by clicking "Edit" on purchase card
    Given that the user has a cost total in the footer
    When the user selects "edit" on the purchase card
    Then the applicable modal will open

  @proj:united
  Scenario:[United] User can see "Are you sure you want to remove 'purchase option'?" prompt on "Customize Flight" page by clicking "Remove" on purchase card
    Given that the user has a cost total in the footer
    When the user selects "remove" on a specific card
    Then the card will turn blue with overlay text "are you sure you want to remove "purchase option"" with Yes and No options

  @proj:united
  Scenario:[United] User can remove added card option on "Customize Flight" page
    Given that the card has turned blue
    When the user selects "Yes"
    Then the cost will be removed from the footer and the card will be removed