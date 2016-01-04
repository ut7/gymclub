function drawShape(canvas_id){
  var canvas = document.getElementById(canvas_id);
  
  if (canvas.getContext){
  
     // use getContext to use the canvas for drawing
     var ctx = canvas.getContext('2d');
  
     ctx.beginPath();
     ctx.translate(100,150)
     ctx.moveTo(0,0);
     ctx.lineTo(10,0);

     ctx.translate(10,0)
     ctx.rotate(-Math.PI / 3);
     ctx.lineTo(10,0);

     ctx.translate(10,0)
     ctx.rotate(-Math.PI / 3);
     ctx.lineTo(10,0);

     ctx.translate(10,0)
     ctx.rotate(Math.PI / 3);
     ctx.lineTo(10,0);

     ctx.translate(10,0)
     ctx.rotate(Math.PI / 3);
     ctx.lineTo(10,0);

     ctx.translate(10,0)
     ctx.rotate(Math.PI / 3);
     ctx.lineTo(10,0);

     ctx.stroke();

  }


  else {
     alert('You need Safari or Firefox 1.5+ to see this demo.');
  }
}
