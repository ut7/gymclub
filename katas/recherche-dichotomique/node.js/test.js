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
});
