Feature: player plays the game

	As a player
	I want to play a game
	So that it can try to guess the animal I'm thinking of
	
	Scenario: game asks the first question
		Given that the game is running
		When the game asks the first question
		Then I should see "Is it a mouse?"