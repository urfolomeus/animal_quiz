module QuizHelper
  def prefix(string)
    if %w(a e i o u).include?(string[0].chr)
      s = "an #{string}"
    else
      s = "a #{string}"
    end
  end
end