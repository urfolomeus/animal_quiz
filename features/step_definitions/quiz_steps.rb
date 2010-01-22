def quiz
  @quiz ||= AnimalQuiz::Quiz.new(responder)
end

def responder
  @responder ||= StringIO.new
end

def should_respond(response)
  @responder.string.split("\n").should include(response)
end

Given /^that the game is not running$/ do
end

Given /^that the game is running$/ do
  quiz
end

Given /^that the game has asked a question$/ do
  quiz.guess
end

When /^I start the game$/ do
  quiz
end

When /^the game asks the first question$/ do
  quiz.guess
end

When /^the player answers "([^\""]*)"$/ do |response|
  quiz.answer(response)
end

Then /^it should ask me to think of an animal$/ do
  should_respond("Think of an animal and I will try to guess it.")
end

Then /^I should see "([^\""]*)"$/ do |response|
  should_respond(response)
end