module AnimalQuiz
  class Quiz
    def initialize(responder)
      @responder = responder
      @responder.puts "Is it a mouse?"
    end
  end
end