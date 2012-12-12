var assert = require("assert");

describe("Ma fonction recherche", function () {
  var recherche = require("./recherche");

  describe("sur une liste vide", function () {
    it("retourne toujours -1", function () {
      assert.equal(-1, recherche(3, []));
    });
  });

  describe("sur une liste à un élément", function () {
    it("retourne 0 pour l'élément de la liste", function () {
      assert.equal(0, recherche(3, [3]));
    });

    it("retourne -1 pour tous les autres cas", function () {
      assert.equal(-1, recherche(1, [3]));
    });
  });

  describe("sur une liste à trois éléments", function () {
    it("retourne 1 pour l'élément du milieu", function () {
      assert.equal(1, recherche(3, [1, 3, 5]));
    });

    it("retourne 0 pour l'élément à gauche", function () {
      assert.equal(0, recherche(1, [1, 3, 5]));
    });

    it("retourne 2 pour l'élément à droite", function () {
      assert.equal(2, recherche(5, [1, 3, 5]));
    });
  });

  describe("sur une liste à sept éléments", function () {
    it("retourne 1 pour l'élément au milieu de la partie gauche", function () {
      assert.equal(1, recherche(3, [1, 3, 5, 7, 9, 11, 13]));
    });
  });

  describe("sur une liste de longueur paire", function () {
    it("je peux retrouver tous les éléments", function() {
      var liste = [1, 3];
      assert.equal(0, recherche(1, liste));
      assert.equal(1, recherche(3, liste));
      assert.equal(-1, recherche(0, liste));
      assert.equal(-1, recherche(2, liste));
      assert.equal(-1, recherche(4, liste));
    });
  });

  describe("sur les cas de recette", function () {
    it("fonctionne aussi", function () {
      var liste, liste_taille_paire;

      liste = [1, 3, 5, 7, 9];
      assert.equal(0, recherche(1, liste));
      assert.equal(1, recherche(3, liste));
      assert.equal(2, recherche(5, liste));
      assert.equal(3, recherche(7, liste));
      assert.equal(4, recherche(9, liste));

      assert.equal(-1, recherche(0, liste));
      assert.equal(-1, recherche(2, liste));
      assert.equal(-1, recherche(4, liste));
      assert.equal(-1, recherche(6, liste));
      assert.equal(-1, recherche(8, liste));
      assert.equal(-1, recherche(10, liste));

      liste_taille_paire = [1, 3, 5, 7, 9, 11];
      assert.equal(0, recherche(1, liste_taille_paire));
      assert.equal(1, recherche(3, liste_taille_paire));
      assert.equal(2, recherche(5, liste_taille_paire));
      assert.equal(3, recherche(7, liste_taille_paire));
      assert.equal(4, recherche(9, liste_taille_paire));
      assert.equal(5, recherche(11, liste_taille_paire));

      assert.equal(-1, recherche(0, liste_taille_paire));
      assert.equal(-1, recherche(2, liste_taille_paire));
      assert.equal(-1, recherche(4, liste_taille_paire));
      assert.equal(-1, recherche(6, liste_taille_paire));
      assert.equal(-1, recherche(8, liste_taille_paire));
      assert.equal(-1, recherche(10, liste_taille_paire));
      assert.equal(-1, recherche(12, liste_taille_paire));
    });
  });
});
