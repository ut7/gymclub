convertis = function (arabe) {
    switch (arabe) {
	case 0:
          return "";
        case 1:
          return "I";
        case 2:
          return "II";
        case 3: 
          return "III";
        case 4:
          return "IV";
    }
    if (arabe >= 5) {
        return "V" + convertis(arabe - 5);
    }
};

describe("Le convertisseur", function () {
    it("convertit 1 en I", function () {
        expect(convertis(1)).toEqual("I");
    });
   
    it("convertit 5 en V", function () {
        expect(convertis(5)).toEqual("V");
    });
   
    it("convertit 6 en VI", function () {
        expect(convertis(6)).toEqual("VI");
    });
   
    it("convertit 2 en II", function () {
        expect(convertis(2)).toEqual("II");
    });

    it("convertit 7 en VII", function () {
        expect(convertis(7)).toEqual("VII");
    });

    it("convertit 3 en III", function () {
        expect(convertis(3)).toEqual("III");
    });

    it("convertit 4 en IV", function () {
        expect(convertis(4)).toEqual("IV");
    });

    it("convertit 8 en VIII", function () {
        expect(convertis(8)).toEqual("VIII");
    });

   
});
