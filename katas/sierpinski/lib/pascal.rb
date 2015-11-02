class Pascal
  def self.triangle(nb_lines)
    pascal = []
    if (nb_lines >= 1) 
      pascal << [1]
    end

    if (nb_lines >= 2)
      pascal << [1,1]
    end
      
    for i in 3..(nb_lines) do
      pascal << construitLigne(pascal[i-2])
    end
    pascal
  end

  def self.construitLigne(previous_line) 
    line = [1]
    for i in 0..(previous_line.size - 2) do
      line << previous_line[i] + previous_line[i+1]
    end
    line << 1
    line
  end
end
