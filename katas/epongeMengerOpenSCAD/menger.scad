module cube_troue(grand_cote, niveau) {
  cote = grand_cote / 3;
  petit_cote = cote / 3;
  eps = cote / 5;

  translate([-(grand_cote/3), -(grand_cote/3), -(grand_cote/3)])
    for(k=[0:2])
      for(j=[0:2])
        for(i=[0:2])
          if (
            ((i!=1)||(j!=1)) &&
            ((k!=1)||(j!=1)) &&
            ((i!=1)||(k!=1))
          )
            translate([cote*k, cote*i, cote*j])
              if (niveau ==1)
                cube(cote, center = true);
              else
                cube_troue(cote, niveau - 1);
}

cube_troue(30, 3);