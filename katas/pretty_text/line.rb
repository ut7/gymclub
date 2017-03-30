class Line
  def initialize(length_max)
    @length_max = length_max
    @line = ''
  end

  def add_word(word)
    return @line += word if @line.length == 0
    separator = ' '
    if @line.length + word.length + separator.length <= @length_max    
      @line = @line + separator + word
    else
      false 
    end
  end

  def to_s
    @line.to_s
  end
end
