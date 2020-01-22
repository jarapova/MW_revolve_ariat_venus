#Projects:
#@proj:united

Feature: Check Bags

#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can see "hazardous materials" modal on baggage page by clicking "Continue to payment" button
    Given that the check bags screen is displayed
    When "continue to payment" has been selected
    Then the "hazardous materials" will display in a modal

  @proj:united
  Scenario:[United] User can see baggage page from "hazardous materials" modal by clicking "Cancel" button
    Given that the hazardous materials modal is displayed
    When the user selects cancel
    Then the modal will close and the screen will return to the check bags screen

  @proj:united
  Scenario:[United] User can see payment page from "hazardous materials" modal by clicking "Accept" button
    Given that the hazardous materials modal is displayed
    When the user selects accept
    Then the application will proceed to the payment page
