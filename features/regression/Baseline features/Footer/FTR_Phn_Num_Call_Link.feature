#Projects:
#@proj:venus
#@proj:revolve


Feature: As a customer, I can make a call by clicking on phone number
  FTR - Phone Number

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can make a call by clicking on phone number
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] User can make a call by clicking on phone number
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-324][REV-365] Phone number is different based on the country selected
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-453] User can see phone number on the AMP version of the footer
    Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @manual
  Scenario:[Venus] User can make a call by clicking on phone number
    Given test steps are under design
