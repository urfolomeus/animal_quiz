Feature: user starts game

	As a user
	I want to start a new game
	So that it can try to guess the animal I'm thinking of
	
	Scenario: starting a game
		Given that the game is not running
		When I start the game
		Then it should ask me to think of an animal