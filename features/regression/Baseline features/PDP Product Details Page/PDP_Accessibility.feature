#Projects:
#@proj:ariat

Feature: The PDP page should be validated with Google Lighthouse score to have 100% accessibility.
  PDP - Accessibility

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] PDP is 100% accessibility compliant by Google Lighthouse
    Given test steps are under design

#================================  [Ariat]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:ariat @manual
  Scenario:[Ariat] PDP is 100% accessibility compliant by Google Lighthouse
    Given test steps are under design