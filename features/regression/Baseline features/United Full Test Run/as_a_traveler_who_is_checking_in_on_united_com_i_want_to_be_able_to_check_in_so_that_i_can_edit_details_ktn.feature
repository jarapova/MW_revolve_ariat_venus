#Projects:
#@proj:united

Feature: As a traveler who is checking in on united.com I want to be able to check in So that I can edit details KTN

#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] User can open TN/Pass info modal by clicking tooltip on "Edit Passenger Details" modal
    Given that "edit details" is displayed
    When "what’s this?" under TN/Pass ID/DOD ID is displayed
    Then display a modal with the following information

  @proj:united
  Scenario:[United] User can close TN/Pass info modal by clicking tooltip on "Edit Passenger Details" modal
    Given that the KTN modal is displayed
    When the user clicks on (x)
    Then return to the "edit details" modal and close the "what’s this?" modal

  @proj:united
  Scenario:[United] User can open Redress Number info modal by clicking tooltip on "Edit Passenger Details" modal
    Given that "edit details" is displayed
    When "what’s this?" under redress number is selected
    Then display a modal with the following information

  @proj:united
  Scenario:[United] User can close Redress Number info modal by clicking tooltip on "Edit Passenger Details" modal
    Given that the redress modal is displayed
    When the user clicks on the (x)
    Then the modal will close and the user will be returned to the "edit details" modal

  @proj:united
  Scenario:[United] User can see error on submitting invalid Redress Number on "Edit Passenger Details" modal
    Given that a redress number has been entered
    When the user clicks "save"
    And the redress number is not validated
    Then display the error

  @proj:united
  Scenario:[United] User can see error on submitting invalid KTN on "Edit Passenger Details" modal
    Given that a KTN has been entered
    When the user clicks "save"
    And the KTN is not validated
    Then display the error
