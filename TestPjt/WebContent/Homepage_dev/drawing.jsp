<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Canvas</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<style>
    body{padding: 5%;text-align: center;}
    canvas{border: 1px solid gray;border-radius: 3px;}
</style>
<body>
    <canvas width='1050' height='750' id='canvas' ></canvas>
</body>
</html>

<script>    
    const canvas = document.getElementById('canvas');
    const ctx = canvas.getContext('2d');
    var img = new Image();   // Create new img element
    img.src = 'img/back.png';
    img.onload = function() {
        ctx.drawImage(img, 0, 0);
    };
</script>