class Item

  attr_accessor :name, :sell_in, :quality, :update_block

  def initialize(name, sell_in, quality, &update_block)
    @name = name
    @sell_in = sell_in
    @quality = quality
    @update_block = block_given? ? update_block : method(:default_update_block)
  end

  def update_quality
    @update_block.call(self)
  end

  def ==(other)
    other.name == name && other.sell_in == sell_in && other.quality == quality
  end

  private

  def default_update_block(item)
    if (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")
      if (item.quality > 0)
        if (item.name != "Sulfuras, Hand of Ragnaros")
          item.quality = item.quality - 1
        end
      end
    else
      if (item.quality < 50)
        item.quality = item.quality + 1
        if (item.name == "Backstage passes to a TAFKAL80ETC concert")
          if (item.sell_in < 11)
            if (item.quality < 50)
              item.quality = item.quality + 1
            end
          end
          if (item.sell_in < 6)
            if (item.quality < 50)
              item.quality = item.quality + 1
            end
          end
        end
      end
    end
    if (item.name != "Sulfuras, Hand of Ragnaros")
      item.sell_in = item.sell_in - 1;
    end
    if (item.sell_in < 0)
      if (item.name != "Aged Brie")
        if (item.name != "Backstage passes to a TAFKAL80ETC concert")
          if (item.quality > 0)
            if (item.name != "Sulfuras, Hand of Ragnaros")
              item.quality = item.quality - 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if (item.quality < 50)
          item.quality = item.quality + 1
        end
      end
    end
  end

end
