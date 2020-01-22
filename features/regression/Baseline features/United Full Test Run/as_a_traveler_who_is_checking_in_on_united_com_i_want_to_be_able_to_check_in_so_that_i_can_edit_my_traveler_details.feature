#Projects:
#@proj:united

Feature: As a traveler who is checking in on united.com I want to be able to check in So that I can edit my traveler details


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can view "Edit Passenger Details" modal by clicking "Edit Details" button
    Given that "confirm or edit your traveler details" is displayed
    When the user clicks on "edit details"
    Then the "edit details" modal will display

  @proj:united
  Scenario:[United] User can see passenger name on "Edit Passenger Details" modal
    Given that the modal is displayed
    Then the passenger’s name should appear at the top of the modal as shown in the comp

  @proj:united
  Scenario:[United] User can see text messaging terms and conditions page through link on "Edit Passenger Details" modal
    Given that the modal is displayed
    When "view text messaging terms and conditions" is selected
    Then open https://www.united.com/ual/en/us/fly/account/sms.html in a new tab

  @proj:united
  Scenario:[United] User can close "Edit Passenger Details" modal by clicking "Cancel" button
    Given that the modal is displayed
    When the user selects cancel
    Then return to "confirm or edit your traveler details"

  @proj:united
  Scenario:[United] User can save valid changes on "Edit Passenger Details" modal by clicking "Save" button
    Given that the modal is displayed
    When the user selects save
    And the information is validated
    Then return to "confirm or edit your traveler details" and display the new information

  @proj:united
  Scenario:[United] User cannot save invalid changes on "Edit Passenger Details" modal by clicking "Save" button
    Given that the modal is displayed
    When the user selects save
    And the information is all/partially not validated
    Then display the appropriate error messages

  @proj:united
  Scenario:[United] User can see validation message after changes saved on "Confirm or edit your traveler details" page
    Given that "Confirm or edit your traveler details" is displayed
    When the user has already edited their travel details
    Then display "You’ve successfully updated "traveler’s first/last name" details." As shown in comp

  @proj:united
  Scenario:[United] User can validate traveler details on "Confirm or edit your traveler details" page
    Given that "confirm or edit your traveler details" is displayed
    When the user selects "looks good"
    Then the user will proceed to the next screen "your reservation"
