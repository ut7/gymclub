# encoding: utf-8

require_relative "../panier"

# Un libraire en ligne veut faire des promos de Noël sur la collection "Harry
# Potter". Il y a actuellement 5 tomes différents disponibles, identifiés par
# les codes 0, 1, 2, 3, et 4. Chaque tome vendu séparément coûte 8 euros. Si
# un client achète deux tomes différents en même temps, il bénéficie d'une
# réduction de 5% sur ces deux tomes. S'il achète trois tomes différents, la
# réduction est de 10% sur ces tomes. Quatre tomes, réduction de 20 % ; et si le
# client achète la grande totale (5 tomes différents), il bénéficie royalement
# de 25% de réduction sur ces 5 tomes.
#
# Il est possible de bénéficier de plusieurs offres de réduction pour un même
# achat groupé, mais chaque livre acheté ne contribue qu'à une seule réduction
# à la fois. Lorsque deux combinaisons de réduction sont possibles -- par
# exemple, lorsque le client achète 5 tomes différents, on peut soit appliquer
# la réduction pour les 5 tomes, soit la réduction pour 2 tomes et la réduction
# pour 3 tomes -- c'est celle qui offre la plus grande réduction globale qui
# est retenue. Dans l'exemple cité au dessus, on choisira donc la réduction
# s'appliquant à 5 tomes différents.
#
# Il s'agit d'implémenter la fonction montantTotal qui, prenant en entrée la
# liste des identifiants des livres qu'un client souhaite acheter, calcule le
# montant total à payer.
#
# Les tests de recette sont les suivants (on a utilisé une syntaxe ruby, à
# traduire dans un autre langage si désiré).
#
# def testCasBasiques
#   assert_equal(0, montantTotal([]))
#   assert_equal(8, montantTotal([0]))
#   assert_equal(8, montantTotal([1]))
#   assert_equal(8, montantTotal([2]))
#   assert_equal(8, montantTotal([3]))
#   assert_equal(8, montantTotal([4]))
#   assert_equal(8 * 2, montantTotal([0, 0]))
#   assert_equal(8 * 3, montantTotal([1, 1, 1]))
# end
#
# def testReductionsSimples
#   assert_equal(8 * 2 * 0.95, montantTotal([0, 1]))
#   assert_equal(8 * 3 * 0.9, montantTotal([0, 2, 4]))
#   assert_equal(8 * 4 * 0.8, montantTotal([0, 1, 2, 4]))
#   assert_equal(8 * 5 * 0.75, montantTotal([0, 1, 2, 3, 4]))
# end
#
# def testPlusieursReductionsCombinees
#   assert_equal(8 + (8 * 2 * 0.95), montantTotal([0, 0, 1]))
#   assert_equal(2 * (8 * 2 * 0.95), montantTotal([0, 0, 1, 1]))
#   assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), montantTotal([0, 0, 1, 2, 2, 3]))
#   assert_equal(8 + (8 * 5 * 0.75), montantTotal([0, 1, 1, 2, 3, 4]))
# end
#
# def testCasTordus
#   assert_equal(2 * (8 * 4 * 0.8), montantTotal([0, 0, 1, 1, 2, 2, 3, 4]))
#   assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8),
#     montantTotal([0, 0, 0, 0, 0,
#                   1, 1, 1, 1, 1,
#                   2, 2, 2, 2,
#                   3, 3, 3, 3, 3,
#                   4, 4, 4, 4]))
# end


describe Panier do
  describe ".montant_total" do

      # arguments   , resultats
    [
      [ []           , 0        ],
      [ [0]          , 8        ],
      [ [0,0]        , 8 * 2    ]

    ].each do |args, result|


      it "#{args} -> #{result}" do
        expect( described_class.montant_total(args) ).to eq(result)
      end

    end

  end

end
