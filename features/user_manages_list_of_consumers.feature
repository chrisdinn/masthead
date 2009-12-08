Feature: User manages list of consumers
  As a user
  I want to be able to manage a list of consumers
  So that only selected apps can share authentication

  Background:
	Given I am signed in

  Scenario: User views list of consumers
	Given there are valid consumers
	When I go to the consumers page
	Then I should see all the consumers

  Scenario: User adds a new consumer 
	Given I am on the new consumer page
	When I fill out the consumer form
	And I press "Add consumer"
	Then I should see the consumer on the consumers page

  Scenario: User removes an existing consumer
	Given there are valid consumers
	And I am on the consumers page
	When I follow the delete link next to a consumer
	Then that consumer should no longer have access