require './gilded_rose.rb'
require './gilded_rose_legacy.rb'
require "rspec"

describe GildedRose do

  let :legacy do
    GildedRoseLegacy.new
  end

  it "behaves like GildedRoseLegacy" do
    subject.update_quality
    legacy.update_quality

    subject.items.should == legacy.instance_variable_get(:@items)
  end
end
