<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
	<script src="JS/jquery.autocomplete.js"></script>	
</head>
<body>
	<div style="width: 300px; margin: 50px auto;">
		<b>Country</b>   : 
		
		
	</div>
	<textarea rows="30" cols="30"id="country" name="country" class="input_text"   ></textarea>
</body>
<script>
	jQuery(function(){
		$("#country").autocomplete("list.jsp");
	});
</script>
</html>