require './gilded_rose.rb'
require "rspec"

describe GildedRose do

  it "should do something" do
    subject.update_quality
  end

  # Once the sell by date has passed, Quality degrades twice as fast
  it "degrade quality twice as fast" do
    subject.items.select {|i| i.name == "" }
  end

end
