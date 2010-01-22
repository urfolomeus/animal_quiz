Feature: player plays the game

	As a player
	I want to play a game
	So that it can try to guess the animal I'm thinking of
	
	Scenario: the game asks the first question
		Given that the game is running
		When the game asks the first question
		Then I should see "Is it a mouse?"
		
	Scenario: the game guesses correctly
		Given that the game has asked a question
		When the player answers "y"
		Then I should see "Yay! I won."
		
	Scenario: the player gives an unrecgonised response
		Given that the game has asked a question
		When the player answers "bob"
		Then I should see "Eh? y or n only please."