var assert = require("assert");

describe("Ma fonction recherche", function () {
  var recherche = require("./recherche");

  describe("sur une liste vide", function () {
    it("retourne toujours -1", function () {
      assert.equal(-1, recherche.recherche(3, []));
    });
  });
});
