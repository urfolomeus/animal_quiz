module AnimalQuiz
  class Quiz
    attr_accessor :animal, :question, :answer
    
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
      @responder.puts "Thanks. Would you like to play again?"
    end
    
    def learn
      get_actual_animal
      get_distinguishing_question
      get_answer
    end
    
    def get_actual_animal(animal = nil)
      @responder.puts "To help me guess next time, please tell me the animal you were thinking of."
      @animal = animal || gets.chomp!
    end
    
    def get_distinguishing_question(question = nil)
      @responder.puts "Can you give me a question to distinguish between #{prefix(@animal)} and a mouse?"
      @question = question || gets.chomp!
    end
    
    def get_answer(answer = nil)
      @responder.puts "What would your answer for #{@animal} be to '#{@question}' (y or n)?"
      @answer = answer || gets.chomp!
    end
    
    def prefix(string)
      if %w(a e i o u).include?(string[0].chr)
        s = "an #{string}"
      else
        s = "a #{string}"
      end
    end
  end
end