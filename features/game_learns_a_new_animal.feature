Feature: game learns a new animal

	As a player
	I want the game to learn the animal that I was thinking of
	So that it can guess correctly next time that I'm thinking of that animal
	
	Scenario: the player answers dolphin when the game asks for the actual animal
		Given that the game has lost
		And that the game has asked "To help me guess next time, please tell me the animal you were thinking of."
		When I give animal "dolphin"
		Then the game should store animal "dolphin"
		
	Scenario: the player answers elephant when the game asks for the actual animal
		Given that the game has lost
		And that the game has asked "To help me guess next time, please tell me the animal you were thinking of."
		When I give animal "elephant"
		Then the game should store animal "elephant"
		
	Scenario: the game asks for a distinguishing question for dolphin
		Given that the game has lost
		And that the actual animal is "dolphin"
		When I give question "Is it aquatic?"
		Then I should see "Can you give me a question to distinguish between a dolphin and a mouse?"
		And the game should store question "Is it aquatic?"
		
	Scenario: the game asks for a distinguishing question for elephant
		Given that the game has lost
		And that the actual animal is "elephant"
		When I give question "Is it a large animal?"
		Then I should see "Can you give me a question to distinguish between an elephant and a mouse?"
		And the game should store question "Is it a large animal?"
		
	Scenario: the game asks for the answer to the distinguishing question for a dolphin
		Given that the game has lost
		And that the actual animal is "dolphin"
		And the distinguishing question is "Is it aquatic?"
		When I give answer "y"
		Then I should see "What would your answer for dolphin be to 'Is it aquatic?' (y or n)?"
		And the game should store answer "y"
		
	Scenario: the game asks for the answer to the distinguishing question for an elephant
		Given that the game has lost
		And that the actual animal is "elephant"
		And the distinguishing question is "Is it a small animal?"
		When I give answer "n"
		Then I should see "What would your answer for elephant be to 'Is it a small animal?' (y or n)?"
		And the game should store answer "n"