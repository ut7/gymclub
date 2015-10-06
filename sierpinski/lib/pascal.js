var Pascal = {
  triangle: function(ligne) {
    var pascal=[]
    if (ligne >= 1) {
      pascal.push([1])
    }
    if (ligne >= 2) {
      pascal.push([1,1])
    }
    return pascal
  }
}

module.exports = Pascal