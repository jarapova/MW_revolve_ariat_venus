#Projects:
#@proj:united

Feature: Basic Economy


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can see International Basic Economy prompt on Review Travel Details page with International Basic Economy PNR
    Given that the RTD screen is displayed
    When the traveler is on a BE ticket
    Then display the BE pop up – as shown in comp

  @proj:united
  Scenario:[United] User can see Domestic Basic Economy prompt on Review Travel Details page with Domestic Basic Economy PNR
    Given that the RTD screen is displayed
    When the traveler is on a BE ticket
    Then display Basic Economy in orange as shown in comp

  @proj:united
  Scenario:[United] User can see "Not allowed: full-sized carry-on bag" message on baggage page when using Basic Economy PNR
    Given that the user is on a basic economy ticket
    When the "check bags" page is displayed
    Then the messaging will state "not allowed: full-sized carry-on bag" as shown in comp