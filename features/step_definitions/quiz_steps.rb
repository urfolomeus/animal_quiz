def quiz
  @quiz ||= AnimalQuiz::Quiz.new(responder)
end

def responder
  @responder ||= StringIO.new
end

def should_respond(response)
  responder.string.split("\n").should include(response)
end

Given /^that the game is not running$/ do
end

Given /^that the game is running$/ do
  quiz
end

Given /^that the game has made a guess$/ do
  quiz.guess
end

Given /^that the game has asked "([^\""]*)"$/ do |question|
  quiz.learn
end

When /^I start the game$/ do
  quiz
end

When /^the game asks the first question$/ do
  quiz.guess
end

When /^I answer "([^\""]*)"$/ do |response|
  quiz.process_response(response)
end

When /^I give animal "([^\""]*)"$/ do |animal|
  quiz.get_actual_animal(animal)
end

When /^I give question "([^\""]*)"$/ do |question|
  quiz.get_distinguishing_question(question)
end

When /^I give answer "([^\""]*)"$/ do |answer|
  quiz.get_answer(answer)
end

Then /^it should ask me to think of an animal$/ do
  should_respond("Think of an animal and I will try to guess it.")
end

Then /^I should see "([^\""]*)"$/ do |response|
  should_respond(response)
end

Then /^the game should store animal "([^\""]*)"$/ do |animal|
  quiz.animal.should eql(animal)
end

Then /^the game should store question "([^\""]*)"$/ do |question|
  quiz.question.should eql(question)
end

Then /^the game should store answer "([^\""]*)"$/ do |answer|
  quiz.answer.should eql(answer)
end