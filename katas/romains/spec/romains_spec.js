convertis = function (arabe) {
    if (arabe===1) {
        return "I";
    }
    else if (arabe < 5) {
        return "II";
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

   
});
