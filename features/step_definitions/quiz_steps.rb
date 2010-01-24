def quiz
  @quiz ||= AnimalQuiz::Quiz.new(responder)
end

def responder
  @responder ||= StringIO.new
end

def responder_should_contain(response)
  responder.string.split("\n").should include(response)
end

Then /^I should see "([^\""]*)"$/ do |response|
  responder_should_contain(response)
end
