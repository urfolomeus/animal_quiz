def responder
  @responder ||= StringIO.new
end

def should_respond(response)
  @responder.string.split("\n").should include(response)
end

Given /^that the game is not running$/ do
end

When /^I start the game$/ do
  @quiz = AnimalQuiz::Quiz.new(responder)
end

Then /^it should ask me to think of an animal$/ do
  should_respond("Think of an animal and I will try to guess it.")
end