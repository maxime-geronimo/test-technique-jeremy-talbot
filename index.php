<?php
$pdo = new PDO('mysql:host=localhost;dbname=geronimo', 'root', '', array(
	PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
	PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
));

$resultat = $pdo -> query("SELECT * FROM news");
?>
<!DOCTYPE html>

<html lang="fr">
<head>
    <meta charset="utf-8"/>
	<meta name="viewport" content="width= device-width, initial-scale=1.0">
    <title>Test Jeremy Talbot - Geronimo Agency </title>
	<link href="styles.css" rel="stylesheet">
	<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

     
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">dgsn.media</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#">Home</a></li>
        <li><a href="#">Pop culture</a></li>
		<li><a href="#">Design</a></li>
        <li><a href="#">Photography</a></li>
		<li><a href="#">About us</a></li>
        
      </ul>
    </div>
  </div>
</nav>
		
      <header>
	  <img src="img/header.png">
		<h1>Discover smart news
			<br>for smart people.</h1>
	  </header>
     <div class="latest col-12"><span>Latest news</span></div>
	 <div>
		<?php
	 
		while($news = $resultat -> fetch(PDO::FETCH_ASSOC)){
		?>
		<div class=" news col-4">
			<div><img src='img/<?=$news['photo']?>.png'></div>
			<div class="title"><?= $news['title']?></div>
			<div class="text"><?= $news['text']?></div>
			<div class="likes col-6"><i class="fa fa-heart" aria-hidden="true"></i><?= $news['likes']?> likes</div>
			<div class="comments col-6"><i class="fa fa-comment" aria-hidden="true"></i><?= $news['comments']?> comments</div>
		</div>
		<?php
		}?>
	</div>
	<div class="clear"></div>
	<footer class="col-12">
	
		<ul>
			<li><a href="">Instagram</a></li>
			<li><a href="">Facebook</a></li>
			<li><a href="">Twitter</a></li>
			<li><a href="">Terms of service and privacy</a></li>
		</ul>
		
	</footer>
</body>
</html>