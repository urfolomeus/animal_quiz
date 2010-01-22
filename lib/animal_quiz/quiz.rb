module AnimalQuiz
  class Quiz
    def initialize(responder)
      @responder = responder
      @responder.puts "Think of an animal and I will try to guess it."
    end
    
    def guess
      @responder.puts "\n"
      @responder.puts "Is it a mouse?"
    end
    
    def answer(response)
      @responder.puts response
    end
  end
end