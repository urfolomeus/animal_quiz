require File.join(File.dirname(__FILE__), 'quiz_helper.rb')

module AnimalQuiz
  class Quiz
    include QuizHelper
    
    attr_accessor :animal, :question, :answer
    
    def initialize(responder)
      @responder = responder
      @responder.puts "Think of an animal and I will try to guess it."
      @responder.puts "\n"
    end
    
    def guess
      @responder.puts "Is it a mouse?"
    end
    
    def process_response(response)
      case response
      when 'y'
        game_won
      when 'n'
        game_lost
      else
        @responder.puts "Eh? y or n only please."
      end
      play_again
    end
    
    def game_won
      @responder.puts "Yay! I won."
    end
    
    def game_lost
      @responder.puts "Rats! I lost."
      learn
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
    
    def play_again(decision = nil)
      @responder.puts "Would you like to play again?"
      decision ||= gets.chomp!
      if decision == 'y'
        guess
      else
        @responder.puts "Thanks for playing."
      end
    end
  end
end