#Projects:
#@proj:united

Feature: As a traveler who is checking in on united.com I want to be able to check in So that I can edit details email & phone number


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can view "Edit Passenger Details" modal by clicking "Edit Details" button
    Given "confirm or edit your traveler details" is displayed
    When the user selects "Edit details"
    Then display the edit details modal

  @proj:united
  Scenario:[United] User can edit email address by clicking Email address field on "Edit Passenger Details" modal
    Given the "Edit details" modal is displayed
    When the user selects "email"
    Then allow the form to be editable

  @proj:united
  Scenario:[United] User can edit phone number by clicking Mobile number field on "Edit Passenger Details" modal
    Given the "edit details" modal is displayed
    When the user selects "phone number"
    Then allow the form to be editable

  @proj:united
  Scenario:[United] User can see phone number error by clicking "Save" button with invalid number in Mobile number field on "Edit Passenger Details" modal
    Given that "edit details" modal is displayed
    And the user has entered a phone number and selected "save"
    When the phone number is not validated
    Then display the following error message

  @proj:united
  Scenario:[United] User can see email address error by clicking "Save" button with invalid number in Email address field on "Edit Passenger Details" modal
    Given that "edit details" modal is displayed
    And the user has entered an email address and selected "save"
    When the email address is not validated
    Then display the following message

  @proj:united
  Scenario:[United] User can see phone number country selections by clicking phone number country dropdown on "Edit Passenger Details" modal
    Given that "edit details" is displayed
    When the user clicks on "country box"
    Then display the drop-down field

  @proj:united
  Scenario:[United] User can see phone number country selections by using scroll bar on phone number country dropdown on "Edit Passenger Details" modal
    Given that the drop-down country field is displayed
    When the user uses the scroll bar
    Then all the application to scroll up and down

  @proj:united
  Scenario:[United] User can see phone number country selections in sections of 20 on "Edit Passenger Details" modal
    Given that the drop-down country field is displayed
    Then the countries should display in sections of 20

  @proj:united
  Scenario:[United] User can save changes by clicking "Save" button on "Edit Passenger Details" modal
    Given that the modal is displayed
    When the user has made changes and selects "save"
    Then the modal will close

  @proj:united
  Scenario:[United] User can cancel changes by clicking "Save" button on "Edit Passenger Details" modal
    Given that the modal is displayed
    When the user selects "cancel"
    Then the modal will close
