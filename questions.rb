class Questions
  def initialize
    @num1 = rand(1...20)
    @num2 = rand(1...20)
  end

  def question_text
    "What does #{@num1} plus #{@num2} equal?"
  end

  def correct_answer
    @num1 + @num2
  end
end


