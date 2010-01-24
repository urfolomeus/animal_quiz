Feature: player plays the game

	As a player
	I want to play a game
	So that it can try to guess the animal I'm thinking of
	
	Scenario: the game makes the first guess
		Given the game is running
		When the game makes the first guess
		Then I should see the first guess
		
	Scenario: the game receives an unrecgonised response
		Given the game has made a guess
		When I answer "bob"
		Then I should see "Eh? y or n only please."
		
	Scenario: the game has guessed the correct animal
		Given the game has made a guess
		When I answer "y"
		Then I should see "Yay! I won."
	
	Scenario: the game has not guessed the correct animal
		Given the game has made a guess
		When I answer "n"
		Then I should see "Rats! I lost."
		
	Scenario: the game asks if I want to play again and I do not
		Given the game is over
		When I do not want to play again
		Then I should see "Thanks for playing."

	Scenario: the game asks if I want to play again and I do
		Given the game is over
		When I do want to play again
		Then I should see the first guess