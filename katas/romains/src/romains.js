convertis = function (arabe) {
    if (arabe == 0) return "";

    var table = [ [50,"L"], [40,"XL"], [10,"X"], [9,"IX"], [5,"V"], [4,"IV"], [1,"I"] ];
    for (var index in table) {
      if (arabe >= table[index][0]) {
         return table[index][1] + convertis(arabe - table[index][0]);
      };
    }
};


