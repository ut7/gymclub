var construitLigne = function(previous_line) {
  var line = [1];
  for (i=0; i < previous_line.length - 1; i++) {
    line.push(previous_line[i] + previous_line[i+1]);
  };
  line.push(1);  
  return line;
};

var triangle = function(nb_lines) {
  var pascal = [];
  if (nb_lines >= 1) {
    pascal.push([1]);
  }

  if (nb_lines >= 2) {
    pascal.push([1,1]);
  }
  
  for (index=2; index< nb_lines; index++) {
    pascal.push(construitLigne(pascal[index-1]));
  }
  return pascal;
}
module.exports.triangle = triangle
