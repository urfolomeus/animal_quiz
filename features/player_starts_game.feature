Feature: player starts game

	As a player
	I want to start a new game
	So that I can play the game
	
	Scenario: starting a game
		Given the game is not running
		When I start the game
		Then I should see "Think of an animal and I will try to guess it."