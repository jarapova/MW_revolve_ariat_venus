#Projects:
#@proj:shoecarnival
#@proj:venus

# Feature is removed for Venus


Feature: As a customer, I need to click on the help bubble on the bottom right side of the screen to get help for shopping on the website.
  FTR - Chat/Help Function
  Global - Live Chat

  Venus: Live chat icon is removed.

  BluePlanet: As a customer, I will be presented with a chat icon which I can click to initiate the live chat window.
  The live chat is an external window that launches which asks for name, email, and subject and button to initiate chat.


#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios

  @proj:baseline
  Scenario:[Baseline] User can click on the help bubble on the bottom right side of the screen to get help for shopping on the website.
    Given test steps are under design

#================================  [ShoeCarnival]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:shoecarnival @tobeautomated
  Scenario:[ShoeCarnival] User can click on the help bubble on the bottom right side of the screen to get help for shopping on the website.
    Given test steps are under design




#================================  [Venus]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

# Feature is removed for Venus

#  @proj:venus @tobeautomated #TODO: Ask someone about chatbot feature
#  Scenario:[Venus] User can click on the live chat on the bottom left side of the screen to get help for shopping on the website.
#    Given user is on home_page
#    And user scroll to the bottom of page
#    When user can see "live_chat_social_icon" on footer
#    And user click "live_chat_social_icon" on footer
#    Then user can see "chat_page" on third_party_page


      #================================  [BluePlanet]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios
#Need to be automated if possible

  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] There is a chat icon on all pages which user can click to initiate the live chat window.
    Given test steps are under design


  @proj:blueplanet @tobeautomated
  Scenario:[BluePlanet] The live chat is an external window that launches which asks for name, email, and subject and button to initiate chat
    Given test steps are under design


