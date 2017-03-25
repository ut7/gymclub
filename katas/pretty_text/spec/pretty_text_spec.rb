require './pretty_text'
describe PrettyText do
  it "wraps text" do
    expect(PrettyText.wrap("AAA BBB CC DDDDD E FFFF GG", 6)).to eq("AAA\nBBB CC\nDDDDD\nE FFFF\nGG")
  end
end

