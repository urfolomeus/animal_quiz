Given /^that the game has lost$/ do
  quiz.game_lost
end

Given /^that the game has asked "([^\""]*)"$/ do |question|
  responder_should_contain(question)
end

Given /^that the actual animal is "([^\""]*)"$/ do |animal|
  quiz.animal = animal
end

Given /^that the game has asked for a distinguishing question$/ do
  quiz.get_distinguishing_question
end

Given /^the distinguishing question is "([^\""]*)"$/ do |question|
  quiz.question = question
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

When /^I do not want to play again$/ do
  quiz.play_again('n')
end

When /^I do want to play again$/ do
  quiz.play_again('y')
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