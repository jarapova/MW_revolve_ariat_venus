#Projects:
#@proj:revolve
#@proj:venus
#@proj:stagestores

Feature: As a customer, I will be presented with a promotional banner with a textual message.
  Global - Promo Banner


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can see promotional banner with a text message on all corresponding pages
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] User can click on promotional banner and be taken on expected page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] User can see promotional banner with a text message on all corresponding pages
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] User can click on promotional banner and be taken on expected page
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-359] User can see "Other exclusions may apply" link should be underlined on pop-up
    Given test steps are under design

    #================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:venus @tobeautomated
  Scenario:[Venus] User can see promotional banner with a text message on all corresponding pages
    Given test steps are under design

  @proj:venus @tobeautomated
  Scenario:[Venus] User can click on promotional banner and be taken on expected page
    Given test steps are under design

#================================  [Stagestores]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can see promotional banner with a text message on all corresponding pages
    Given test steps are under design

  @proj:stagestores @tobeautomated
  Scenario:[Stagestores] User can click on promotional banner and be taken on expected page
    Given test steps are under design