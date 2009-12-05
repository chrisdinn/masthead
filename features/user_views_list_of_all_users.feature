Feature: User views list of all users
  As a user
  I want to be able to view a list of all users
  So that I can see which users have access to the system

  Scenario: view list
	Given there are users in the directory
	When I go to the users list page
	Then I should see all the users
	