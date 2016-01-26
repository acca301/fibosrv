<html>
<head>
<script type=text/javascript>
function getResults(src,tgt) {
    var xmlhttp;
    // compatible with IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function(){
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
	    document.getElementById(tgt).innerHTML = xmlhttp.responseText;
	}
    }
    xmlhttp.open('GET', 'compute/'+document.getElementById(src).value, true);
    xmlhttp.send();

}
</script>
</head>
<body>

<h2>Compute First (N) Fibonacci Numbers</h2>
<hr>
<noscript>
    <h2>Please enable JavaScript</h2>
You do not have JavaScript enabled. This page uses JavaScript to update the results on the fly. While there is no specific reason for that,
it is fun.
<p>
Please consider turning JavaScript on.
</noscript>
<table border=1>
  <tr>
    <td>How many Fibonacci numbers to compute?</td>
    <td><input id=uinput type=text placeholder="Enter a positive number" onkeyup="getResults('uinput','results')"></td>
  </tr>
  <tr>
    <td>Results</td>
    <td id='results'></td>
  </tr>
</table>

</body>
</html>
