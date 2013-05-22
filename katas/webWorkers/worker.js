var finish = function(color, origin, width, height) {
  var output = {
    color: color,
    origin: origin,
    height: height,
    width: width
  };
  postMessage(JSON.stringify(output));
};

onmessage = function(event){
  var data = JSON.parse(event.data); 
  var maxSize = Math.max(data.width, data.height);
  ox(data,maxSize);
};

function ox (data, maxSize){
  if (data.resolution > maxSize) {
    finish(data.verticesColors[0], data.origin, data.width, data.height);
  }
  else {
    var w = data.width/2, h = data.height/2;

    finish(data.verticesColors[0], data.origin, w, h);
    finish(colorBlend(data.verticesColors[1],data.verticesColors[0]), {x: data.origin.x+w, y: data.origin.y}, w, h);
    finish(colorBlend(data.verticesColors[1],data.verticesColors[2]), {x: data.origin.x+w, y: data.origin.y+h}, w, h);
    finish(colorBlend(data.verticesColors[0],data.verticesColors[3]), {x: data.origin.x, y: data.origin.y+h}, w, h);
  }
};

function colorBlend(c1,c2){
  var rgb1 = c1.match(/\d+/g);
  var rgb2 = c2.match(/\d+/g);
  var blend = [Math.floor((+rgb1[0]+ +rgb2[0])/2), Math.floor((+rgb1[1]+ +rgb2[1])/2),  Math.floor((+rgb1[2]+ +rgb2[2])/2)];

  return "rgb(" + blend.join(',') + ")";
}
