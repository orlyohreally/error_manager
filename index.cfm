<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<title>Система учета ошибок</title>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	
</head>
  
  <body>

    <cfinclude template = "header.cfm">
	<cfif IsUserLoggedIn() eq "Yes">
		<cflocation url = "errors.cfm">
	<cfelse>
		<cflocation url = "login.cfm">
	</cfif>
  </body>
</html>
