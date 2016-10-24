class Fourmi
  def initialize
    @x = 0
    @y = 0
  end

  def monter(direction)
    @y += 1  
  end

  def afficher
    resultat = " " * @x + "\n" * @y
    puts resultat
  end
end
