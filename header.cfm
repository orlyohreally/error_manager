
<!DOCTYPE html>
<html>
  <head>
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<title>Войти в систему - Система учета ошибок</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">	
	<script src ="https://code.jquery.com/jquery-2.2.2.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<link rel = "stylesheet" type = "text/css" href = "styles.css"/>
</head>
  <body>
  <nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Система учета ошибок</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
			  <li id = "new-error"><a href="new_error.cfm">Ввод новой ошибки</a></li>
			  <li id = "errors"><a href="errors.cfm">Ошибки</a></li>
			  <li id = "users"><a href="users.cfm">Пользователи</a></li>
			  <li id = "logout"><a href="logout.cfm">Выход</a></li>
			</ul>

		</div>
	</div>
</nav>