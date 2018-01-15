document.addEventListener("DOMContentLoaded", function(){
  const cvas = document.getElementById("mycanvas");
  cvas.width = 500;
  cvas.height = 500;

  const ctx = cvas.getContext("2d");
  ctx.fillStyle = "yellow";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();
});
