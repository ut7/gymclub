require 'curses'

class VuePlateauCurses
  COULEURS = [
    { basic: ' ', advanced: Curses::COLOR_BLACK },
    { basic: 'x', advanced: Curses::COLOR_WHITE },
    { basic: 'o', advanced: Curses::COLOR_RED },
    { basic: 'i', advanced: Curses::COLOR_YELLOW }
  ]

  def initialize(with_color=true)
    @with_color = with_color
    Curses.init_screen
    if terminal_has_colors?
      Curses.start_color
      i=0
      COULEURS.each_with_index do |couleur, index|
        Curses.init_pair(index, Curses::COLOR_BLUE, couleur[:advanced])
      end
    end
  end

  def affiche(couleur, ligne, colonne)
    Curses.setpos(ligne, colonne)
    colorie_case(couleur)
    Curses.refresh
  end

  def terminal_has_colors?
    Curses.has_colors? && @with_color
  end

  def colorie_case(couleur)
    if terminal_has_colors?
      colorie_case_advanced(couleur)
    else
      colorie_case_basic(couleur)
    end
  end

  def colorie_case_basic(couleur)
    Curses.addstr(COULEURS[couleur][:basic])
  end

  def colorie_case_advanced(couleur)
    Curses.attrset(Curses.color_pair(couleur))
    Curses.addstr(' ')
  end

  def eteint
    Curses.close_screen
  end
end
