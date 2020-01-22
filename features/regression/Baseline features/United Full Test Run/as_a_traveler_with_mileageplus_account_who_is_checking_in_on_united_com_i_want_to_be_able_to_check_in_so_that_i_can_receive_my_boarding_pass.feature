#Projects:
#@proj:united

Feature: As a MileagePlus traveler who is checking in on united.com I want to be able to check in So that I can receive my reservation info


#================================  [United]   ================================================================
#This is list of project related scenarios. should be covered by test steps depending on project user flows.
#Need to be automated if possible

  @proj:united
  Scenario:[United] Users can only enter characters (0-9) And (A-Z) on MileagePlus field on check-in page
    Given the MileagePlus number box has been selected
    Then allow characters (0-9) And (A-Z)


  @proj:united
  Scenario:[United] Users can only enter maximum 8 characters on MileagePlus field on check-in page
    Given the MileagePlus number box has been selected
    Then restrict the character count to 8 characters

  @proj:united
  Scenario:[United] Users see only * characters when entering text on MileagePlus Password field on check-in page
    Given the Password box has been selected
    When characters are entered
    Then hide them as a *

  @proj:united
  Scenario:[United] Users can only enter maximum 30 characters on MileagePlus Password field on check-in page
    Given the Password box has been selected
    Then restrict the character count to 30 characters

  @proj:united
   Scenario:[United] Users see empty MileagePlus Password field on check-in page after submitting incorrect password
     Given that the password doesn’t match the account
    When "Sign In (Secure)" is selected
     Then the password text box should display as empty

  @proj:united
  Scenario:[United] Users see "Forgotten MP Number" page in new tab when clicking "Forgot your MileagePlus number?" on check-in page
     Given that the MileagePlus sign in is displayed
    When "Forgot your MileagePlus number?" is selectedм
     Then accountNumberResolution.aspx in a new tab

  @proj:united 
  Scenario:[United] Users see "Forgotten Password" page in new tab when clicking "Forgot your Password" on check-in page
     Given that the MileagePlus sign in is displayed
    When "Forgot your Password" is selected
     Then open passwordrecovery in a new tab

  @proj:united
   Scenario:[United] Users signed in with MP account with eligible flights for check-in can proceed to check-in by clicking listed eligible flight
     Given that the MileagePlus sign in is displayed
     And the MileagePlus number and password are properly entered
     And the user has a flight eligible for check in
    When the user selects "Sign In (Secure)"
    Then proceed to the screen "Confirm or edit your

  @proj:united
   Scenario:[United] Users see error when submitting invalid credentials on check-in page
     Given that the password or MileagePlus number does not match the account
    When "Sign In (Secure)" is selected
     Then display the following error

  @proj:united
   Scenario:[United] Users see error when submitting invalid credentials on check-in page
     Given that the MileagePlus number doesn’t match to an account or password
    When "Sign In (Secure)" is selected
     Then the MileagePlus text box should display the entered MP number Unsure of current functionality as