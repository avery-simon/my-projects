<?php
$vote=$_POST["vote"];
$email=$_POST["email"];

$file1=file_get_contents('vote.csv').$vote.PHP_EOL;
file_put_contents('vote.csv',$file1);

$file2=file_get_contents('email.csv').$email.PHP_EOL;
file_put_contents('email.csv',$file2);

$emails=file_get_contents('email.csv');
$votes=file_get_contents('vote.csv');

$B=0;
$T=0;
if ($vote=="biden"){
	$B=$B+1;
}
else{
	$T=$T+1;
}
?>
<html>
<head>
	<h1><center><u>Results of Presidential Candidate Poll</u></center></h1>
</head>
<body bgcolor="pink"> 
<form action="http://i6.cims.nyu.edu/~as12668/index.php" method="POST">
	<input type="radio" id="email" name="choice" value="email" onclick="show1()">
	<label for="email">Email List </label>
	<br>
	<input type="radio" id="hist" name="choice" value="hist" onclick="show2()">
	<label for="hist">Histogram </label>
</form>
<br>
<hr><hr><hr>
<div id="result1" style="display:none">
	<h2><b>List of Responders: </b></h2>
		<br><?php echo $emails;?>
</div>
<div id="result2" style="display:none">
	<h2><b>Chart of Poll Results: </b></h2>
		<br> 
		Joe Biden <div id='joeNum' style="display: inline;"><b>0</b></div>
		<svg id="_r1_" width="10" height="10">
			<rect id="r1" width="10" height="10" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"/>
		</svg>
		<br><br><br>
		Donald Trump <div id='donNum' style="display: inline;"><b>0</b></div>
		<svg id="_r2_" width="10" height="10">
			<rect id="r2" width="10" height="10" style="fill:rgb(255,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>
		</svg>
</div>
</body>
<script type="text/javascript">
	function show1(){
		document.getElementById("result2").style.display='none';
		document.getElementById("result1").style.display='inline';
	}
	var B=<?php echo $B ?>;
	var T=<?php echo $T ?>;
	function show2(){
		document.getElementById("result1").style.display='none';
		document.getElementById("result2").style.display='inline';
    	document.getElementById("joeNum").innerHTML=B;
    	document.getElementById("donNum").innerHTML=T;

    	document.getElementById("r1").setAttribute("height","50");
    	document.getElementById("r1").setAttribute("width",B*20);
    	document.getElementById("_r1_").setAttribute("height","50");
    	document.getElementById("_r1_").setAttribute("width",B*20);


    	document.getElementById("r2").setAttribute("height","50");
    	document.getElementById("r2").setAttribute("width",T*20);
    	document.getElementById("_r2_").setAttribute("height","50");
    	document.getElementById("_r2_").setAttribute("width",T*20);
	}
</script>
</html>