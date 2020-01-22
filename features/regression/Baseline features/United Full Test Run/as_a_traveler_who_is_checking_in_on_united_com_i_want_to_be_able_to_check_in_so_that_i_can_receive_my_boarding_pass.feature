#Projects:
#@proj:united

Feature: As a traveler who is checking in on united.com I want to be able to check in So that I can receive my boarding pass


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can open "What’s this?" modal on check-in page by clicking "What’s this?" button
    Given that the flight check-in page is displayed
    When the user selects "What’s this?"
    Then a modal should appear

  @proj:united
  Scenario:[United] User can view information in "What’s this?" modal on check-in page
    Given that the modal has appeared
    Then the information inside the modal will state

  @proj:united
  Scenario:[United] User can close the "What’s this?" modal on check-in page by clicking "X" button
    Given that the modal has appeared
    When the user selects (X) in the upper righthand corner
    Then the modal should close

  @proj:united
  Scenario:[United] User sees text color change when hovering over "Confirmation or eTicket number"
    Given that the user hovers over "Confirmation or eTicket number"
    Then the color should change to (awaiting hover state color)

  @proj:united
  Scenario:[United] User sees text color change back when hovering off of "Confirmation or eTicket number"
    Given that the user hovers off "Confirmation or eTicket number"
    Then the color should return to grey, as displayed in comp

  @proj:united
  Scenario:[United] User sees text color change when hovering over last name field
    Given that the user hovers over "Last name"
    Then the color should change to (awaiting hover state color)

  @proj:united
  Scenario:[United] User sees text color change back when hovering off of last name field
    Given that the user hovers off "Last name"
    Then the color should return to grey, as displayed in comp

  @proj:united
  Scenario:[United] User sees "MileagePlus login" highlighted when selected on check-in page
    Given Flight check-in is displayed
    When the user selects "MileagePlus login"
    Then the circle next to "MileagePlus login" will be filled
    And the circle next to "Confirmation number" will be empty

  @proj:united
  Scenario:[United] User can only enter 30 characters maximum when "last name" field selected on check-in page
    Given Flight check-in is displayed
    When the user selects the "last name" box
    Then restrict the character count to 30

  @proj:united
  Scenario:[United] User can only enter 14 characters maximum when "confirmation or eticket number" field selected on check-in page
    Given Flight check-in is displayed
    When the user selects "confirmation or eticket number"
    Then restrict the character count to 14

  @proj:united
  Scenario:[United] User can only enter (0-9) and (A-Z) characters when "confirmation or eticket number" field selected on check-in page
    Given Flight Check-in is displayed
    When the user selects "confirmation or eticket number"
    Then allow characters (0-9) And (A-Z)

  @proj:united
  Scenario:[United] User can only enter (A-Z) characters when "last name" field selected on check-in page
    Given Flight Check-in is displayed
    When the user selects "last name"
    Then allow characters (A-Z)

  @proj:united
  Scenario:[United] User sees error message after entering invalid PNR information on check-in page
    Given that the user has entered their confirmation and last name
    When the user selects "Continue"
    And the information is incorrect
    Then display the following error message:

  @proj:united
  Scenario:[United] User can view "Learn more about our check-in and boarding requirements" page in new tab on check-in page
    Given that the user selects "Learn more about our check-in and boarding requirements"
    Then https://www.united.com/web/en-US/content/travel/airport/process/default.aspx will open in a new tab

  @proj:united
  Scenario:[United] User can view "Find more information and help" page in new tab on check-in page
    Given that the user selects "Find more information and help"
    Then https://www.united.com/ual/en/us/fly/help/faq/online-check-in.html will open in a new tab