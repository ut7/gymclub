require 'curses'

class VuePlateauCurses
  COULEURS = {
    blanc: { id: 1, basic: ' ', advanced: Curses::COLOR_BLACK },
    noir:  { id: 2, basic: 'x', advanced: Curses::COLOR_WHITE }
  }

  def initialize(with_color=true)
    @with_color = with_color
    Curses.init_screen
    if terminal_has_colors?
      Curses.start_color
      i=0
      COULEURS.keys.each do |couleur|
        Curses.init_pair(COULEURS[couleur][:id], Curses::COLOR_BLUE, COULEURS[couleur][:advanced])
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
    Curses.attrset(Curses.color_pair(COULEURS[couleur][:id]))
    Curses.addstr(' ')
  end

  def eteint
    Curses.close_screen
  end
end
