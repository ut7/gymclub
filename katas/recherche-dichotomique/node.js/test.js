var assert = require("assert");

describe("Ma fonction recherche", function () {
  var recherche = require("./recherche");

  describe("sur une liste vide", function () {
    it("retourne toujours -1", function () {
      assert.equal(-1, recherche.recherche(3, []));
    });
  });

  describe("sur une liste à un élément", function () {
    it("retourne 0 pour l'élément de la liste", function () {
      assert.equal(0, recherche.recherche(3, [3]));
    });

    it("retourne -1 pour tous les autres cas", function () {
      assert.equal(-1, recherche.recherche(1, [3]));
    });
  });
});
