require 'simplecov'
SimpleCov.start do
  add_filter ".bundle"
end

require './gilded_rose.rb'
require './gilded_rose_legacy.rb'
require "rspec"


describe GildedRose do

  let :legacy do
    GildedRoseLegacy.new
  end

  it "behaves like GildedRoseLegacy" do
    subject.items.pop

    60.times do
      subject.update_quality
      legacy.update_quality

      subject.items.should == legacy.instance_variable_get(:@items)
    end
  end

  context "when implementing new behaviour" do
    let(:item) { subject.items.last }

    context "Mana Cake quality" do
      it "degrades twice as fast" do
        item.update_quality
        item.sell_in.should == 2
        item.quality.should == 4

        item.update_quality
        item.sell_in.should == 1
        item.quality.should == 2

        item.update_quality
        item.sell_in.should == 0
        item.quality.should == 0

        item.update_quality
        item.sell_in.should == -1
        item.quality.should == 0
      end
    end
  end

end
