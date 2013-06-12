require './item.rb'

class GildedRose

  attr_accessor :items

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6) do |item|
      item.sell_in -= 1
      item.quality = [0, item.quality - 2].max
    end
  end

  def update_quality
    items.each {|item| item.update_quality }
  end

end
