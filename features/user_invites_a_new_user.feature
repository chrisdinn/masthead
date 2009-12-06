Feature: Users must invite new users
	As a user
	I want to be able to invite new users
	So that I can give selected people access
	
	Scenario: user sends an invitation 
		Given I am signed in
		And I am on the new user invite page
		When I fill in "Email" with "new@testaddress.com"
		And I press "Send invitation"
		Then an invitation should be sent to "new@testaddress.com"
	
	Scenario: user sees pending invitations
		Given I am signed in
		And pending invitations exist
		When I am on the users list page
		Then I should see all the pending invitations		