class PrettyText
  def self.wrap(text, max)
    lines = []
    words = text.split
    line_length = 0
    words_line = []

    words.each do |word|
      line_length += word.length
      if line_length <= max
        words_line << word
        line_length += 1
      else
        lines << words_line.join(' ')
        words_line = []
        line_length = 0
        words_line << word
        line_length += word.length
        line_length += 1
      end
    end
    lines << words_line.join(' ')
    lines.join("\n")
  end

end
