var canvas = document.getElementsByTagName('canvas')[0];
var ctxt = canvas.getContext('2d');

var worker = new Worker('worker.js');

var workerCallback = function(e){
  console.log(e.data);
  var data = JSON.parse(e.data);
  ctxt.fillStyle=data.color;
  ctxt.fillRect(data.origin.x, data.origin.y, data.width, data.height);
};

worker.addEventListener('message', workerCallback, false);


var data = {
  origin:     {x: 50, y: 50} ,
  width: 100,
  height: 100,
  resolution: 51,
  verticesColors: ["rgb(0,0,0)","rgb(255,0,0)","rgb(0,255,0)","rgb(0,0,255)"] 
};

worker.postMessage(JSON.stringify(data));
