require 'pascal'

describe Pascal do
  it "doit renvoyer comme première ligne 1" do
    expect(Pascal::triangle(1)).to eq([[1]])
  end

  it "doit renvoyer comme deuxieme ligne 1,1" do
    expect(Pascal::triangle(2)).to eq([[1],[1,1]])
  end

  it "doit renvoyer comme troisieme ligne 1,2,1" do
    expect(Pascal::triangle(3)).to eq([[1],[1,1],[1,2,1]])
  end

  it "doit renvoyer comme quatrieme ligne 1,3,3,1" do
    expect(Pascal::triangle(4)).to eq([[1],[1,1],[1,2,1],[1,3,3,1]])
  end

  it "doit renvoyer comme 300e ligne 300 elements" do
    expect(Pascal::triangle(300)[299].size).to eq(300)
  end

end
