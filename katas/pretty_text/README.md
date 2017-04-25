# Exo 1

Écrire une fonction `wrap` qui prend en entrée une (longue) chaîne de caractère et un nombre de caractère maximum, et qui retourne une nouvelle chaîne, dont le texte est identique à l'ancienne, mais avec des retours à la ligne insérés aux bons endroits pour que le texte ne dépasse le nombre de caractères maximum sur aucune des lignes. Si un mot est trop long par rapport au nombre de caractères maximum, il peut (au choix) être coupé à l'intérieur, ou laissé entier tel quel. On imagine que le texte est affiché avec des caractères de taille fixe (non-proportionnelle).

ex. :

"AAA BBB CC DDDDD E FFFF GG" sur 6 caractères maximum donne :
"AAA\nBBB CC\nDDDD\nE FFFF\nGG"

# Exo 2

2. plutôt qu'un nombre fixe de colonnes maximum, passer en paramètre d'entrée une fonction `shape` qui renvoie le nombre de colonnes maximum _pour la ligne en cours_.
2a. écrire la fonction `shape` qui permet de formater le texte sur une colonne de largeur X
2b. écrire la fonction `shape` qui permet de formater le texte en triangle rectangle
2c. écrire la fonction `shape` qui permet de formater le texte en triangle équilatéral
2d. écrire la fonction `shape` qui permet de formater le texte en disque

Note : pour 2c. et 2d., il y aura probablement un facteur correctif à ajouter, pour compenser le fait que la hauteur d'un caractère est généralement plus grande que sa largeur.

ex :
```
                      Early one mornin' the sun
                   was shinin' I was layin' in bed
               Wondrin' if she'd changed at all If her
              hair was still red Her folks they said our
          lives together Sure was gonna be rough They never
        did like Mama's homemade dress Papa's bank book wasn't
      big enough And I was standin' on the side of the road Rain
    fallin' on my shoes Heading out for the east coast Lord knows
    I've paid some dues Gettin' through Tangled up in blue She was
  married when we first met Soon to be divorced I helped her out of
  a jam I guess But I used a little too much force We drove that car
as far as we could Abandoned it out west Split up on a dark sad night
  Both agreeing it was best She turned around to look at me As I was
 walkin' away I heard her say over my shoulder We'll meet again some
 day On the avenue Tangled up in blue I had a job in the great north
 woods Working as a cook for a spell But I never did like it all that
 much And one day the axe just fell So I drifted down to New Orleans
   Where I was looking for to be employed Workin' for a while on a
fishin' boat Right outside of Delacroix But all the while I was alone
    The past was close behind I seen a lot of women But she never
  escaped my mind And I just grew Tangled up in blue She was workin'
      in a topless place And I stopped in for a beer I just kept
    lookin' at the side of her face In the spotlight so clear And
      later on as the crowd thinned out I's just about to do the
       same She was standing there in back of my chair Said to
           me, Don't I know your name? I muttered somethin'
             under my breath She studied the lines on my
               face I must admit I felt a little uneasy
                 When she bent down to tie the laces
                       Of my shoe Tangled up in
                                 blue
```




Si tout ça est trop facile : revoir l'algorithme de `wrap` pour qu'il minimise le nombre d'espace « en creux » en fin de ligne.
