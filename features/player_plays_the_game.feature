Feature: player plays the game

	As a player
	I want to play a game
	So that it can try to guess the animal I'm thinking of
	
	Scenario: the game asks the first question
		Given that the game is running
		When the game asks the first question
		Then I should see "Is it a mouse?"
		
	Scenario: the game receives an unrecgonised response
		Given that the game has made a guess
		When I answer "bob"
		Then I should see "Eh? y or n only please."
		
	Scenario: the game guesses correctly
		Given that the game has made a guess
		When I answer "y"
		Then I should see "Yay! I won."
		And I should see "Thanks for playing."
	
	Scenario: the game guesses incorrectly
		Given that the game has made a guess
		When I answer "n"
		Then I should see "Rats! I lost."
		And I should see "To help me guess next time, please tell me the animal you were thinking of."