require 'rspec'
require './tourette'

describe 'chatbot' do
  it 'écoute et repond' do
    declenche_evenement_input = nil

    input = double('input')
    expect(input).to receive(:lorsque_nouvelle_question) do |&block|
      declenche_evenement_input = block
    end

    brain = double('brain')
    expect(brain).to receive(:answer).with('ça va ?').and_return('non')

    output = double('output')
    expect(output).to receive(:display_answer).with('non')

    tourette = Tourette.new(brain, input, output)
    declenche_evenement_input.call('ça va ?')
  end
end
