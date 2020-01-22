#Projects:
#@proj:united

Feature: As traveler I want to use Complete check my traveler details modal


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can see "not checked in yet" error messaging after check in with Basic Economy PNR
    Given that the user is on a basic economy ticket
    And did not opt to bring a checked bag
    When the clicks "complete check in"
    Then the user is not checked in yet and will receive messaging as shown in comp

  @proj:united
  Scenario:[United] User can see baggage page with not check-in Basic Economy PNR
    Given that the user is on a basic economy ticket
    And is not checked in yet
    When they click on check bags
    Then the application will proceed to the baggage screen

  @proj:united
  Scenario:[United] User can enter email address for boarding pass email on confirmation page
    Given that the screen is displayed
    When the user clicks on the email box
    Then allow the box to be editable

  @proj:united
  Scenario:[United] User can see boarding pass email after submitting email address on confirmation page
    Given that the screen is displayed
    When the user clicks on the email box
    And the user has provided their email earlier in the flow
    Then the users email should be displayed in the email box
