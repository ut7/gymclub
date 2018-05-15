require 'readline'
require './tourette'

class Brain
  def answer(question)
    "n'importe quoi"
  end
end

class Input
  def lorsque_nouvelle_question(&block)
    @block_a_garder = block
  end

  def ecoute_prochaine_question
    question = Readline.readline("> ")
    @block_a_garder.call(question)
  end
end

class Output
  def display_answer(answer)
    puts "< #{answer}"
  end
end

brain = Brain.new
input = Input.new
output = Output.new

tourette = Tourette.new(brain, input, output)

while(true) do
  input.ecoute_prochaine_question
end
