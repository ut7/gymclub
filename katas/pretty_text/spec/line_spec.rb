require './line'
require 'rspec'

describe Line do
  describe 'add_word' do
    context 'empty line' do
      line = Line.new(5)
      it "ajoute le mot complet sans le tronquer" do
        line.add_word("123456")
        expect(line.to_s).to eq("123456")
      end
    end
    context 'line with words' do
      let(:line) do
        line =  Line.new(6)
        line.add_word("AA")
        line
      end

      it "ajoute un mot si la longueur de la ligne <= 6" do
        line.add_word("123")
        expect(line.to_s).to eq("AA 123")
      end
      it "n'ajoute pas le mot si cela fait dépasser la longueur de la ligne" do
        expect(line.add_word("1234")).to be_falsy
        expect(line.to_s).to eq("AA")
      end
    end
  end 
end
