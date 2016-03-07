convertis = function (arabe) {
    if (arabe===1) {
        return "I";
    }
    else if (arabe == 2) {
        return "II";
    }
    else if (arabe == 3) {
        return "III";
    }
    else if (arabe == 4) {
        return "IV";
    }
    else if (arabe > 5) {
        reste = arabe - 5;
        reste_romains = convertis(reste);
        return "V" + reste_romains;
    }
    return "V";
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
