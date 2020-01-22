#Projects:
#@proj:united

Feature:  As a traveler who is checking in on united.com I want to be able to check in So that I can edit details frequent flyer number


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can view "Edit Passenger Details" modal by clicking "Edit Details" button
    Given that "confirm or edit your traveler details" is displayed
    When "edit details" is selected
    Then display the modal for "edit details"

  @proj:united
  Scenario:[United] User can see Frequent Flyer programs by using scroll bar on Frequent Flyer dropdown in "Edit Passenger Details" modal
    Given that "edit details" is displayed
    When the user selects the Frequent Flyer program drop down
    Then display the following programs in a scroll function 20 showing at a time

  @proj:united
  Scenario:[United] User can select Frequent Flyer programs on Frequent Flyer dropdown in "Edit Passenger Details" modal
    Given that the Frequent Flyer program drop down is displayed
    When the user selects a program
    Then close the drop down and display the selected program

  @proj:united
  Scenario:[United] User sees entered account number partially hidden in "Edit Passenger Details" modal
    Given that the user selects the editable box under "account number"
    When the user types
    Then display the first two characters and replace the others with a *

  @proj:united
  Scenario:[United] User can select Frequent Flyer program and enter valid account number in "Edit Passenger Details" modal
    Given that the user has selected a program and entered an account number
    When the user selects "continue"
    And the account is validated
    Then proceed to the "confirm or edit your traveler details" screen

  @proj:united
  Scenario:[United] User cannot submit valid Frequent Flyer program with an invalid account number in "Edit Passenger Details" modal
    Given that the user has selected a program and entered an account number
    When the user selects "continue"
    And the account is not validated
    Then display the error message

  @proj:united
  Scenario:[United] User can close "Edit Passenger Details" modal
    Given that "edit details" is displayed
    When the user selects "cancel"
    Then return the modal will close
