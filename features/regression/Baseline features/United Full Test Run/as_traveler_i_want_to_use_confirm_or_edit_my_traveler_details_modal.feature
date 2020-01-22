#Projects:
#@proj:united

Feature: As traveler I want to use Confirm or edit my traveler details modal


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can proceed to "Review your flight details" page on TCD page by clicking "Continue" button
    Given that the user has selected "continue" on the previous page
    Then display "confirm or edit your traveler details"

  @proj:united
  Scenario:[United] User can see previously-provided email, phone, frequent flyer or KTN information on "Edit Traveler Details" modal
    Given the screen is displayed
    When the user has already provided their email, phone, frequent flyer or KTN
    Then display that information as shown in comp

  @proj:united
  Scenario:[United] User can see "Edit Traveler Details" modal by clicking "Edit Details" on TCD page
    Given that the screen is displayed
    When the "edit details" is selected
    Then the "edit details" modal will appear

  @proj:united
  Scenario:[United] User can save details on "Edit Traveler Details" modal by clicking "Save" button
    Given that the "edit details" modal is displayed
    When "save" is selected
    Then the modal will save the information and close

  @proj:united
  Scenario:[United] User sees "You did not enter any contact information" message on "edit details" modal by clicking "Save" without any changes
    Given that the "edit details" modal is displayed
    When "save" is selected
    And the user has not entered any information
    Then display the "You did not enter any contact information" modal

  @proj:united
  Scenario:[United] User sees "Edit Details" modal after seeing "You did not enter any contact information" message by clicking "Enter information"
    Given "You did not enter any contact information" is displayed
    When the user selects "Enter information"
    Then the modal will close and return to the "edit details" modal

  @proj:united
  Scenario:[United] User sees "Review Travel Details" page after "You did not enter any contact information" message by clicking "Continue without entering" button
    Given "You did not enter any contact information" is displayed
    When the user selects "continue without entering"
    Then both modals will close

  @proj:united
  Scenario:[United] User sees updated information on "confirm or edit your traveler details" page
    Given the user has updated their traveler details
    When "confirm or edit your traveler details" is displayed
    Then the updated information will be displayed as shown in comp

  @proj:united
  Scenario:[United] User sees "Add Infant" modal on "Confirm or edit your travel details" page by clicking "Add Infant"
    Given that "confirm or edit your travel details" is displayed
    When the user selects "add infant"
    Then the "add infant" modal will appear

  @proj:united
  Scenario:[United] User can see Lap Infant Tooltip modal on "Confirm or edit your travel details" page by clicking "?" button
    Given that "confirm or edit your travel details" is displayed
    When the user selects the (?) by "traveling with a lap infant"
    Then display the lap infant information modal as shown in comp

  @proj:united
  Scenario:[United] User can close Lap Infant Tooltip modal by clicking "X" button
    Given that the lap infant information modal is displayed
    When the user selects the (x)
    Then the modal will be closed

  @proj:united
  Scenario:[United] User can see "Your Reservation" page after "Confirm or edit your travel details" page by clicking "Continue" button
    Given "confirm or edit your travel details" is displayed
    When "continue" is selected
    Then proceed to the next screen "your reservation"

  @proj:united
  Scenario:[United] User can view "Confirm or edit your traveler details" page after clicking "Get Started" on check-in page
    Given that the user has selected "Get Started"
    Then proceed to "Confirm or edit your traveler details"

  @proj:united
  Scenario:[United] User can see multiple travelers using multi-pax PNR on "Confirm or edit your traveler details" page
    Given that the "Confirm or edit your traveler details" screen is displayed
    When there are multiple people in the itinerary
    Then display the travelers as shown in comp