Feature: This test suite declares the United Check-in Paths

# Check-in error: Flight has departed

  Scenario:[United] As user and guest I want to check-in for a flight that has already departed
    Given user is on home_page
    When user click confirmation_number
    And user enters expired PNR
    Then user sees expired PNR error

# Check-in error: Flight has not been ticketed

  Scenario:[United] As user and guest I want to check-in for a flight that has not been ticketed
    Given user is on home_page
    When user click confirmation_number
    And user enters unticketed PNR
    Then user sees unticketed PNR error

# Check-in error: Passenger is too young for online check-in

  Scenario:[United] As user and guest I want to check-in for a flight which has a single passenger under 14 years old
    Given user is on home_page
    When user click confirmation_number
    And user enters underage passenger PNR
    Then user sees underage passenger PNR error

# Check-in error: Generic Error

  Scenario:[United] As user and guest I want to check-in for a flight that will produce a generic PNR error
    Given user is on home_page
    When user click confirmation_number
    And user enters generic error PNR
    Then user sees generic PNR error

# Single PAX One-way PNR Check-in

  Scenario:[United] As user and guest I want to check-in for a single-passenger one-way flight
    Given user is on home_page
    When user click confirmation_number
    And user enters PNR
    And user click submit_button
    Then user sees confirm_passenger_details_page
    And user click on continue_button
    Then user sees confirm_passenger_details_modal
    And user click on continue_button
    Then user sees confirm_flight_itinerary_page
    And user click on continue_button
    Then user sees departing_flight_seating_map_page
    And user click on continue_without_selecting_seat_button
    Then user sees baggage_details_page
    And user click on no_additional_baggage_button
    Then user sees hazardous_materials_warning_modal
    And user click on confirmation_button
    Then user sees checkin_confirmation_page

# Multi-PAX One-way PNR Check-in

  Scenario:[United] As user and guest I want to check-in for a multi-passenger one-way flight
    Given user is on home_page
    When user click confirmation_number
    And user enters PNR
    And user click submit_button
    Then user sees multi_pax_checkin_modal
    And user click submit_button
    Then user sees confirm_passenger_details_page
    And user click on continue_button
    Then user sees confirm_passenger_details_modal
    And user click on continue_button
    Then user sees confirm_flight_itinerary_page
    And user click on continue_button
    Then user sees departing_flight_seating_map_page
    And user click on continue_without_selecting_seat_button
    Then user sees baggage_details_page
    And user click on no_additional_baggage_button
    Then user sees hazardous_materials_warning_modal
    And user click on confirmation_button
    Then user sees checkin_confirmation_page


# Single PAX Round-Trip PNR Check-in

  Scenario:[United] As user and guest I want to check-in for a single-passenger round-trip flight
    Given user is on home_page
    When user click confirmation_number
    And user enters PNR
    And user click submit_button
    Then user sees confirm_passenger_details_page
    And user click on continue_button
    Then user sees confirm_passenger_details_modal
    And user click on continue_button
    Then user sees confirm_flight_itinerary_page
    And user click on continue_button
    Then user sees departing_flight_seating_map_page
    And user click next_flight_button
    Then user sees arriving_flight_seating_map_page
    And user click on continue_without_selecting_seat_button
    Then user sees baggage_details_page
    And user click on no_additional_baggage_button
    Then user sees hazardous_materials_warning_modal
    And user click on confirmation_button
    Then user sees checkin_confirmation_page

# Multi-PAX Round-Trip PNR Check-in

  Scenario:[United] As user and guest I want to check-in for a multi-passenger round-trip flight
    Given user is on home_page
    When user click confirmation_number
    And user enters PNR
    And user click submit_button
    Then user sees multi_pax_checkin_modal
    And user click submit_button
    Then user sees confirm_passenger_details_page
    And user click on continue_button
    Then user sees confirm_passenger_details_modal
    And user click on continue_button
    Then user sees confirm_flight_itinerary_page
    And user click on continue_button
    Then user sees departing_flight_seating_map_page
    And user click next_flight_button
    Then user sees arriving_flight_seating_map_page
    And user click on continue_without_selecting_seat_button
    Then user sees baggage_details_page
    And user click on no_additional_baggage_button
    Then user sees hazardous_materials_warning_modal
    And user click on confirmation_button
    Then user sees checkin_confirmation_page