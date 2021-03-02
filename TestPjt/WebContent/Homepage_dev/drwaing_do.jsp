<html>
<head>
<title>Canvas do</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<style>
    body{padding: 5%;text-align: center;}
    canvas{border: 1px solid gray;border-radius: 3px;}
</style>
<body>
    <canvas width='1009' height='701' id='canvas' ></canvas>
</body>
</html>

<script>    
    
    /* const canvas =document.getElementById('canvas');
    const ctx =canvas.getContext('2d');
    ctx.setLineDash([5,5])
    ctx.lineDashOffset=-1; 
    ctx.beginPath();
    ctx.strokeStyle='blue';
    ctx.lineWidth = 3;
    ctx.moveTo(20,100);
    ctx.lineTo(50,150);
    ctx.lineTo(80,100);
    ctx.stroke();
   	ctx.fillStyle ='rgba(50,50,110,0.5)';//채우는 색상 지정
   	ctx.fill();  */
   	
   /* 	var text ='I\'m canvas!';
   	
   	const canvas = document.getElementById('canvas');
   	const ctx = canvas.getContext('2d');
   	
   	ctx.font ='22px serif';
   	
   	ctx.fillStyle ='rgba(0,50,50,0.5)';
   	ctx.strokeStyle='rgba(56,77,120,0.5)';
   	
   	ctx.fillText(text,150,200);
   	ctx.strokeText(text,150,300);
   	
    var len = ctx.measureText(text);
    console.log('텍스트 길이는요 -> ',len);
   	
    cfx.fillText(text,100,100);
    
   	ctx.fillStyle = 'rgba(97, 226, 110, 1)';
   	ctx.fillText(text,150,250); */
   	
   	const canvas =document.getElementById('canvas');
   	const ctx = canvas.getContext('2d');
   	var img = new Image(); //새로운 이미지 형성
   	img.src = 'img/visit.png';
   	img.onload = function(){
   		ctx.drawImage(img,0,0);
   	}

  
    
    
    
</script>