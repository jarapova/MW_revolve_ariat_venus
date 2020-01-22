#Projects:
#@proj:united

Feature: International Basic Economy


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can see International Basic Economy message on RTD page when using IBE PNR
    Given that the traveler is on an IBE ticket
    When the RTD screen is displayed
    Then display the Basic Economy restrictions card

  @proj:united
  Scenario:[United] User can see "Baggage information" page in new tab after clicking "Baggage Information" in Basic Economy restrictions card on RTD page
    Given that the Basic Economy restrictions card is displayed
    When "Baggage information" is selected
    Then open https://www.united.com/ual/en/us/fly/travel/baggage.html in a new tab

  @proj:united
  Scenario:[United] User sees Basic Economy in flight details on RTD page when using IBE PNR
    Given that the traveler is on an IBE ticket
    When the RTD screen is displayed
    Then display "Basic Economy" with the orange background under details, as shown in comp

  @proj:united
  Scenario:[United] User sees "Bag service charges may apply for your restricted international economy fare" message on Baggage page when using IBE PNR
    Given that the traveler is on an IBE ticket
    When the check bags screen is displayed
    Then display the text "Bag service charges may apply for your restricted international economy fare"