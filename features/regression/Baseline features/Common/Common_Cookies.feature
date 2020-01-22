#Projects:
#@proj:revolve

Feature: As a customer, I want to store my information via cookies correctly

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Check cookie-headers are not duplicated
    Given test steps are under design

    @proj:baseline
  Scenario:[Baseline] "x-moov-cache-reason: miss: No cache requested in response" header should not be presented for every corresponding page
    Given test steps are under design

#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve][REV-246] Check cookie-headers are not duplicated
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve][REV-282] "x-moov-cache-reason: miss: No cache requested in response" header should not be presented for every corresponding page
    Given test steps are under design


#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @manual
  Scenario:[ShoeCarnival][SCP-172] Cookie is adding after user landing on any PWA page, and stays during browsing whole website, includes non-pwa pages
  For all pages on the PWA, including the ones in which we have perfect-proxying.
  pwa=true cookie
  No matter where they go, they are attributed to the "pwa" segment, including right through checkout
    Given test steps are under design