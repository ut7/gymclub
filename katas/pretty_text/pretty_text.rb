class PrettyText
  def self.wrap(text, max)
    lines = []
    words = text.split

    line = Line.new(max)

    words.each do |word|
      if ! line.add_word(word)
        lines << line
        line = Line.new(max)
        line.add_word(word)
      end
    end
    lines << line
    lines.map {|line| line.to_s}.join("\n")
 end
end
