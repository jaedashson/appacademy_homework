document.addEventListener("DOMContentLoaded", function(){
  // Phase I: Setting up your Canvas Element
  const mycanvas = document.getElementById("mycanvas");
  mycanvas.width = 500;
  mycanvas.width = 500;

  const ctx = mycanvas.getContext("2d");

  // Phase II: Draw a Rectangle
  ctx.fillStyle = "orange";
  ctx.fillRect(0, 0, 500, 500);


  // Phase III: Draw a Circle
  ctx.beginPath();
  ctx.arc(100, 100, 40, 0, 2*Math.PI, true);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 3;
  ctx.stroke();
  // Fill in the circle
  ctx.fillStyle = "pink";
  ctx.fill();
});
