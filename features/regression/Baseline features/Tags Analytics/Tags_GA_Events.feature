#Projects:
#@proj:revolve
#@proj:blueplanet

Feature: Enhanced Ecommerce tracking will be implemented with Google Analytics in Google Tag Manager. This comprises the following events or actions:
  Tags - GTM - GA Events

#The following custom events will be tracked with Google Analytics via Google Tag Manager:
#Product - Click
#When a customer clicks on a product tile, an event will be fired with the following information:
#    Event Category: product
#    Event Action: click  (PDP View)
#    Event Label: product code
#Product - Add to Shopping Bag
#When a customer adds a product to their shopping bag, an event will be fired with the following information:
#    Event Category: product
#    Event Action: click (Add to Cart)
#    Event Label: addToCart
#Product - Remove from Shopping Bag
#When a customer removes a product to their shopping bag, an event will be fired with the following information:
#    Event Category: product
#    Event Action: click (Remove from Cart)
#    Event Label: removeFromCart

#================================  [Baseline]   ================================================================
#This is list of baseline scenarios. Should not be covered by steps. Should be used as a template for projects scenarios


  @proj:baseline
  Scenario:[Baseline] Check Enhanced Ecommerce tracking
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check Product - click custom event is presented with information above
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check Add to shopping bag custom event is presented with information above
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check Remove from shopping bag custom event is presented with information above
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check Enhanced Ecommerce tracking on AMP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check Product - click custom event is presented with information above on AMP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check Add to shopping bag custom event is presented with information above on AMP
    Given test steps are under design

  @proj:baseline
  Scenario:[Baseline] Check Remove from shopping bag custom event is presented with information above on AMP
    Given test steps are under design


#================================  [Revolve]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:revolve @manual
  Scenario:[Revolve] Check Enhanced Ecommerce tracking
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check Product - click custom event is presented with information above
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check Add to shopping bag custom event is presented with information above
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check Remove from shopping bag custom event is presented with information above
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check Enhanced Ecommerce tracking on AMP
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check Product - click custom event is presented with information above on AMP
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check Add to shopping bag custom event is presented with information above on AMP
    Given test steps are under design

  @proj:revolve @manual
  Scenario:[Revolve] Check Remove from shopping bag custom event is presented with information above on AMP
    Given test steps are under design



#================================  [BluePlanet]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Enhanced Ecommerce tracking
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Product - click custom event is presented with information above
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Add to shopping bag custom event is presented with information above
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Remove from shopping bag custom event is presented with information above
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Enhanced Ecommerce tracking on AMP
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Product - click custom event is presented with information above on AMP
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Add to shopping bag custom event is presented with information above on AMP
    Given test steps are under design

  @proj:blueplanet @manual
  Scenario:[BluePlanet] Check Remove from shopping bag custom event is presented with information above on AMP
    Given test steps are under design