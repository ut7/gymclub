describe("Le convertisseur", function () {
    it("convertit 1 en I", function () {
        expect(convertis(1)).toEqual("I");
    });
   
    it("convertit 2 en II", function () {
        expect(convertis(2)).toEqual("II");
    });

    it("convertit 3 en III", function () {
        expect(convertis(3)).toEqual("III");
    });

    it("convertit 4 en IV", function () {
        expect(convertis(4)).toEqual("IV");
    });


    it("convertit 5 en V", function () {
        expect(convertis(5)).toEqual("V");
    });
   
    it("convertit 6 en VI", function () {
        expect(convertis(6)).toEqual("VI");
    });
   
    it("convertit 7 en VII", function () {
        expect(convertis(7)).toEqual("VII");
    });

    it("convertit 8 en VIII", function () {
        expect(convertis(8)).toEqual("VIII");
    });

    it("convertit 9 en IX", function () {
        expect(convertis(9)).toEqual("IX");
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
