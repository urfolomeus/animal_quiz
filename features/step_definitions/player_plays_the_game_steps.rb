Given /^the game is running$/ do
  quiz
end

Given /^the game has made a guess$/ do
  quiz.guess
end

Given /^the game is over$/ do
end

When /^the game makes the first guess$/ do
  quiz.guess
end

When /^I answer "([^\""]*)"$/ do |response|
  quiz.process_response(response)
end

Then /^it should ask me to think of an animal$/ do
  responder_should_contain("Think of an animal and I will try to guess it.")
end

Then /^I should see the first guess$/ do
  responder_should_contain("Is it a mouse?")
end