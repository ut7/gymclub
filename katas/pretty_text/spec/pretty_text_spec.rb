require './pretty_text'
describe PrettyText do
  it "wraps text" do
    expect(PrettyText.wrap("AAA BBB CC DDDDD E FFFF GG", 6)).to eq("AAA\nBBB CC\nDDDDD\nE FFFF\nGG")
    expect(PrettyText.wrap("AAAA", 4)).to eq("AAAA")
    expect(PrettyText.wrap("AAAA BBBB", 4)).to eq("AAAA\nBBBB")
    expect(PrettyText.wrap("AAAA BBBB CC DDDDD", 4)).to eq("AAAA\nBBBB\nCC\nDDDDD")
  end
end

