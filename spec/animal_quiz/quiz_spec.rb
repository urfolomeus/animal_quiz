require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

module AnimalQuiz
  describe Quiz do
    before(:each) do
      @responder = mock("responder").as_null_object
    end
    
    context "starting the game" do
      it "should prompt player to think of an animal" do
        @responder.should_receive(:puts).
          with("Think of an animal and I will try to guess it.")
        quiz = Quiz.new(@responder)
      end
    end
    
    context "playing the game" do
      before(:each) do
        @quiz = Quiz.new(@responder)
      end
      
      it "should ask the user an initial question" do
        @responder.should_receive(:puts).with("Is it a mouse?")
        @quiz.guess
      end
      
      it "should prompt the player for valid input if input invalid" do
        @quiz.guess
        @responder.should_receive(:puts).with("Eh? y or n only please.")
        @quiz.process_response('bob')
      end
    
      context "the game wins" do
        it "should win when guessing the correct animal" do
          @quiz.guess
          @responder.should_receive(:puts).with("Yay! I won.")
          @quiz.process_response('y')
        end
      end
      
      context "the game loses" do
        it "should lose when guessing the wrong animal" do
          @quiz.guess
          @responder.should_receive(:puts).with("Rats! I lost.")
          @quiz.process_response('n')
        end
        
        it "should ask for the animal player was thinking of when lost" do
          @responder.should_receive(:puts).
            with("To help me guess next time, please tell me the animal you were thinking of.")
          @quiz.game_lost
        end    
    
        it "should store the animal player was thinking of" do
          @quiz.get_actual_animal('dolphin')
          @quiz.animal.should eql('dolphin')
        end
      
        it "should ask for a distinguishing question for a dolphin" do
          @quiz.get_actual_animal('dolphin')
          @responder.should_receive(:puts).
            with("Can you give me a question to distinguish between a dolphin and a mouse?")
          @quiz.get_distinguishing_question('Is it aquatic?')
        end
      
        it "should ask for a distinguishing question for a elephant" do
          @quiz.get_actual_animal('elephant')
          @responder.should_receive(:puts).
            with("Can you give me a question to distinguish between an elephant and a mouse?")
          @quiz.get_distinguishing_question('Is it a large animal?')
        end
      
        it "should store the distinguishing question" do
          @quiz.animal = "dolphin"
          @quiz.get_distinguishing_question('Is it aquatic?')
          @quiz.question.should eql('Is it aquatic?')
        end
      
        it "should ask for the answer to the distinguishing question for dolphin" do
          @quiz.animal = "dolphin"
          @quiz.question = "Is it aquatic?"
          @responder.should_receive(:puts).
            with("What would your answer for dolphin be to 'Is it aquatic?' (y or n)?")
          @quiz.get_answer('y')
        end
        
        it "should ask for the answer to the distinguishing question for elephant" do
          @quiz.animal = "elephant"
          @quiz.question = "Is it a small animal?"
          @responder.should_receive(:puts).
            with("What would your answer for elephant be to 'Is it a small animal?' (y or n)?")
          @quiz.get_answer('n')
        end
      
        it "should store the answer to the distinguishing question" do
          @quiz.get_answer('y')
          @quiz.answer.should eql('y')
        end
      
        it "should ask the player if they want to play again" do
          @responder.should_receive(:puts).
            with("Would you like to play again?")
          @quiz.play_again
        end
        
        it "should display exit message if player doesn't want to play again" do
          @responder.should_receive(:puts).with("Thanks for playing.")
          @quiz.play_again('n')
        end
        
        it "should make another guess if player does want to play again" do
          @responder.should_receive(:puts).with("Is it a mouse?")
          @quiz.play_again('y')
        end
      end
    end
  end
end