module.exports = function(s1, s2){
  var res = "",
      a = s1.split(""),
      b = s2.split(""),
      candidat;

  a.forEach(function(c, i){
    candidat = "";

    var index;

    while ((index = b.indexOf(c, index)) != -1){
        candidat = c;
        index++;
        j = i + 1;
        while(j < a.length && index < b.length && a[j] === b[index]){
          candidat += a[j];
          index++;
          j++;
        }

        if(candidat.length > res.length)
        res = candidat;
    }
  });

  return res;
};
