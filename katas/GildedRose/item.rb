class Item

  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def ==(other)
    other.name == name && other.sell_in == sell_in && other.quality == quality
  end

end
