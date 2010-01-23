Feature: game learns a new animal

	As a player
	I want the game to learn the animal that I was thinking of
	So that it can guess correctly next time that I'm thinking of that animal
	
	Scenario: the game asks for the actual animal the player was thinking of
		Given that the game has lost
		And that the game has asked "To help me guess next time, please tell me the animal you were thinking of."
		When I give animal "dolphin"
		Then the game should store animal "dolphin"
		And I should see "Can you give me a question to distinguish between a dolphin and a mouse?"
		
	Scenario: the game asks for a distinguishing question
		Given that the game has lost
		And that the game has asked "Can you give me a question to distinguish between a dolphin and a mouse?"
		When I give question "Is it aquatic?"
		Then the game should store question "Is it aquatic?"
		And I should see "What would your answer for dolphin be to 'Is it aquatic?' (y or n)?"
		
	Scenario: the game asks for the answer to the distinguishing question for the given animal
		Given that the game has lost
		And that the game has asked "What would your answer for dolphin be to 'Is it aquatic?' (y or n)?"
		When I give answer "y"
		Then the game should store answer "y"
		And I should see "Thanks. Would you like to play again?"