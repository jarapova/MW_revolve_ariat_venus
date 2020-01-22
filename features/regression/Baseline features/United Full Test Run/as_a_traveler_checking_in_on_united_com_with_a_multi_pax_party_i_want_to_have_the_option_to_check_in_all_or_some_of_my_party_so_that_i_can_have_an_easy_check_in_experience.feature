#Projects:
#@proj:united

Feature: As a traveler checking in on united.com with a multi-pax party I want to have the option to check in all or some of my party So that I can have an easy check-in experience



#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can view passenger selection modal by entering valid multi-pax PNR on check-in page
    Given that the user is traveling with multiple people in their party
    When they click "continue" on the flight check-in screen
    Then display the "which travelers are checking in for Chicago" modal

  @proj:united
  Scenario:[United] User can deselect passenger on passenger selection modal
    Given that the modal is displayed
    When the user clicks on an already checked box
    Then the box should no longer display as checked in

  @proj:united
  Scenario:[United] User can select passenger on passenger selection modal
    Given that the modal is displayed
    When the user clicks on an unchecked box
    Then the box should show as checked

  @proj:united
  Scenario:[United] User can deselect all passengers on passenger selection modal with "Clear All" button
    Given that the modal is displayed
    When the user selects "clear all"
    Then all the boxes will be marked as empty

  @proj:united
  Scenario:[United] User can select all passengers on passenger selection modal with "Select All" button
    Given that the modal is displayed
    When the user selects "select all"
    Then all the boxes will display check marks

  @proj:united
  Scenario:[United] User can see "Please select at least one traveler to check in" error on passenger selection modal when no passengers selected
    Given that the modal is displayed
    And no traveler is selected
    When "Get Started" is selected
    Then display the following message

  @proj:united
  Scenario:[United] User can see Traveler Confirm Details page through passenger select modal "Continue" button when passenger(s) selected
    Given that the modal is displayed
    When "Get Started" is selected
    Then proceed to the following screen with information for the selected travelers