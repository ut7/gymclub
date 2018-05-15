class Tourette
  attr_reader :brain, :input, :output

  def initialize(brain, input, output)
    @brain, @input, @output = brain, input, output
    input.lorsque_nouvelle_question do |question|
      received_question(question)
    end
  end

  def received_question(question)
    output.display_answer(brain.answer(question))
  end
end
