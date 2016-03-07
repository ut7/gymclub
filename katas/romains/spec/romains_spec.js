convertis = function (arabe) {
    if (arabe >= 40) {
       if (arabe >=50) {
         return "L" + convertis(arabe - 50);
       } else {
         return "XL" + convertis(arabe - 40);
       }
    } 
    if (arabe >= 10) {
        return "X" + convertis(arabe - 10);
    }
    if (arabe >= 5) {
        return "V" + convertis(arabe - 5);
    }
    if (arabe == 4) {
        return "IV";
    }
    if (arabe == 1) {
        return "I";
    }
    if (arabe == 0) {
        return "";
    }
    if (arabe < 4) {
       return "I" + convertis(arabe - 1);
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

    it("convertit 13 en XIII", function () {
        expect(convertis(13)).toEqual("XIII");
    });

    it("convertit 23 en XXIII", function () {
        expect(convertis(23)).toEqual("XXIII");
    });

    it("convertit 43 en XLIII", function () {
        expect(convertis(43)).toEqual("XLIII");
    });


   
});
