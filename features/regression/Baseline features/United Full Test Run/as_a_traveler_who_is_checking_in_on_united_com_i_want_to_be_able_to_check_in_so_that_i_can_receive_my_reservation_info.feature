#Projects:
#@proj:united

Feature: As a traveler who is checking in on united.com I want to be able to check in So that I can receive my reservation info


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can open "Your Reservation" page after confirming traveler details
    Given that the user has clicked "continue"
    Then the "Your Reservation" screen will be displayed

  @proj:united
  Scenario:[United] User can view flight information on "Your Reservation" page
    Given that "Your reservation" is displayed
    Then the passenger’s flight information will be displayed as shown in comp
    And the passenger flight information will be pulled from

  @proj:united
  Scenario:[United] User can review flight information for first passenger on "Your Reservation" page for multi-pax PNR
    Given that "Your Reservation" is displayed
    When the travel is multi-pax
    Then the first name in the reservation will be displayed "Traveler 1, please review your reservation"

  @proj:united
  Scenario:[United] User can view seats selected with multi-pax PNR on "Your Reservation" page
    Given that "Your reservation" is displayed
    When the travel is multi-pax
    Then the seats will be displayed per traveler per flight as shown in comp

  @proj:united
  Scenario:[United] User can open seatmap with multi-pax PNR on "Your Reservation" page
    Given that "Your reservation" is displayed
    When "edit" is selected next to a seat assignment
    Then the seat map will open for that particular traveler and flight

  @proj:united
  Scenario:[United] User can update seat through seatmap with multi-pax PNR on "Your Reservation" page
    Given that "Your reservation" is displayed
    When the traveler has edited their seat
    Then the new seat number should be reflected on the screen

  @proj:united
  Scenario:[United] User can view available flights for Same-Day Change on "Your Reservation" page
    Given that "Your reservation" is displayed
    When "view flights" is selected
    Then the application will proceed to the "available flight screen"

  @proj:united
  Scenario:[United] User can cancel trip on "Your Reservation" page
    Given that "Your reservation" is displayed
    When "cancel this trip" is selected
    Then the cancellation modal will appear

  @proj:united
  Scenario:[United] User can confirm reservation details on "Your Reservation" page
    Given that "Your reservation" is displayed
    When "looks good" is selected
    Then the application will proceed to "Customize"

  @proj:united
  Scenario:[United] User can cancel trip on "Your Reservation" page
    Given that "your reservation" is displayed
    When the user selects "cancel this trip"
    Then the cancellation modal will open

  @proj:united
  Scenario:[United] User can open "Traveler Details" page from "Your Reservation" page
    Given that "Your reservation" is displayed
    When "back" is selected
    Then the application will proceed to the previous screen "traveler details"

