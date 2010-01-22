Feature: player starts game

	As a player
	I want to start a new game
	So that I can play the game
	
	Scenario: starting a game
		Given that the game is not running
		When I start the game
		Then it should ask me to think of an animal