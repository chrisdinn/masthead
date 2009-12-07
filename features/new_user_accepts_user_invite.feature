Feature: New user accepts user invite
	As a new user
	I want to accept my user invite
	So that I can have access to the app
	
	Scenario: clicks on link in invite email
		Given I have a user invite
		When I follow the user invite redemption link
		Then I should be on the redeem user invite page
		
	Scenario: successfully creates an user account from invite
		Given I have received a user invite and clicked on the redemption link
		When I fill out my user details
		And I press "Start using Hot Ink"
		Then I should be a user
		
	Scenario: can't create user account without invite
		Given I visit the user invite redemption page with an invalid invite code
		When I fill out my user details
		And I press "Start using Hot Ink"
		Then I should not be a user
		
		
		
		