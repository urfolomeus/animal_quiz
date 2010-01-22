require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

module AnimalQuiz
  describe Quiz do
    it "should ask first question when started" do
      @responder = mock("responder").as_null_object
      @responder.should_receive(:puts).with("Is it a mouse?")
      quiz = Quiz.new(@responder)
    end
  end
end