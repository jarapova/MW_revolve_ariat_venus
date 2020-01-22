#Projects:
#@proj:venus


Feature: As a customer, I can download mobile app
  FTR - Mobile App Download
#Venus: Android app, iOS app
#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

@proj:baseline
Scenario:[Baseline] User can download Android app by click on appropriate button
  Given test steps are under design

@proj:baseline
Scenario:[Baseline] User can download iOS app by click on appropriate button
  Given test steps are under design

@proj:baseline
Scenario:[Baseline] User can see Android and IOS app icons
  Given test steps are under design

#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

@proj:venus @manual
Scenario:[Venus] User can download Android app by click on appropriate button
  Given test steps are under design

@proj:venus @manual
Scenario:[Venus] User can download iOS app by click on appropriate button
  Given test steps are under design

@proj:venus @automated
Scenario:[Venus] User can see Android and IOS app icons
  Given user is on home_page
  When user scroll to the bottom of page
  Then user can see "download_android_app" on footer
  And user can see "download_ios_app" on footer