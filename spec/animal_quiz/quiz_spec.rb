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
        @quiz.answer('bob')
      end
    
      it "should win when guessing the correct animal" do
        @quiz.guess
        @responder.should_receive(:puts).with("Yay! I won.")
        @quiz.answer('y')
      end
      
      it "should display exit message when it has won" do
        @quiz.guess
        @responder.should_receive(:puts).with("Thanks for playing.")
        @quiz.answer('y')
      end
      
      it "should lose when guessing the wrong animal" do
        @quiz.guess
        @responder.should_receive(:puts).with("Rats! I lost.")
        @quiz.answer('n')
      end
      
      it "should ask for the animal player was thinking of when lost" do
        @quiz.guess
        @responder.should_receive(:puts).
          with("To help me guess next time, please tell me the animal you were thinking of.")
        @quiz.answer('n')
      end
    end
  end
end