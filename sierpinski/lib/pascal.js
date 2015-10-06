var pascal = function(ligne) {
  var pascal=[]
  pascal[0] = [1]
  if (ligne == 1) {
    pascal[1] = [1,1]
  }
  return pascal
}

module.exports = pascal