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
      if response == 'y'
        @responder.puts "Yay! I won."
        @responder.puts "Thanks for playing."
      elsif response == 'n'
        @responder.puts "Rats! I lost."
        @responder.puts "To help me guess next time, please tell me the animal you were thinking of."
      else
        @responder.puts "Eh? y or n only please."
      end
    end
  end
end