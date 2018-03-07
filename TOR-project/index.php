<html>
 <head>
  <title>TOR PHP WEB site - assignment for Trinimbus</title>
 </head>
 <body>
	<h1>Simple DB query - Find user based on location</h1>
	<form method="post">
		<label for="location">Location</label>
		<input type="text" id="location" name="location">
		<input type="submit" name="submit" value="View Results">
	</form>

<a href="index.php">Back to home</a>
</body>
 <?php 
 echo '<p>TOR-Hello Trinimbus!</p>'; 
 echo '<br>Local IP: '.$_SERVER['SERVER_ADDR'];
 ?> 
 </body>
</html> 