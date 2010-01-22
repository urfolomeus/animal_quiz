def responder
  @responder ||= StringIO.new
end

def should_ask(response)
  @responder.string.split("\n").should include(response)
end

Given /^that the game is not running$/ do
end

When /^I start the game$/ do
  quiz = AnimalQuiz::Quiz.new(responder)
end

Then /^it should ask me the first question$/ do
  should_ask("Is it a mouse?")
end