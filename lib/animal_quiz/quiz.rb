module AnimalQuiz
  class Quiz
    attr_reader :animal, :question, :answer
    
    def initialize(responder)
      @responder = responder
      @responder.puts "Think of an animal and I will try to guess it."
    end
    
    def guess
      @responder.puts "\n"
      @responder.puts "Is it a mouse?"
    end
    
    def process_response(response)
      if response == 'y'
        game_won
      elsif response == 'n'
        game_lost
      else
        @responder.puts "Eh? y or n only please."
      end
    end
    
    def game_won
      @responder.puts "Yay! I won."
      @responder.puts "Thanks for playing."
    end
    
    def game_lost
      @responder.puts "Rats! I lost."
      learn
    end
    
    def learn
      @responder.puts "To help me guess next time, please tell me the animal you were thinking of."
      get_actual_animal(gets.chomp!)
      @responder.puts "Can you give me a question to distinguish between a dolphin and a mouse?"
      get_distinguishing_question(gets.chomp!)
      @responder.puts "What would your answer for dolphin be to 'Is it aquatic?' (y or n)?"
    end
    
    def get_actual_animal(animal)
      @animal = animal
    end
    
    def get_distinguishing_question(question)
      @question = question
    end
    
    def get_answer(answer)
      @answer = answer
    end
  end
end