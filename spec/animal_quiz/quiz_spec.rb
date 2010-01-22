require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

module AnimalQuiz
  describe Quiz do
    it "should prompt player to think of an animal" do
      @responder = mock("responder").as_null_object
      @responder.should_receive(:puts).with("Think of an animal and I will try to guess it.")
      quiz = Quiz.new(@responder)
    end
  end
end