<cfif IsUserLoggedIn() eq "Yes">
	<cflocation url = "index.cfm">
<cfelse>
<cfinclude template = "header.cfm">

<cfif structKeyExists(form, 'submit')>
	<cfquery datasource = "error_manager" name = "getUser">
		select FirstName, LastName, idUser from user where idUser = #form.ID# and Password = #form.Password#
	</cfquery>
	<cfif #getUser.RecordCount#>
		<cflogin>
			<cfloginuser name = #form.ID# Password = #form.Password# roles = "user">
		</cflogin>
		<cflocation url = "index.cfm">
	<cfelse>
		<div class="alert alert-danger" role="alert">Введенный ID или праоль указаны неверно!</div>
	</cfif>
</cfif>
	
<div class="container">
    <form action = "login.cfm" method = "post">
		<h2>Войти в систему</h2>
		<input name = "ID" type="text" id="ID" class="form-control" placeholder="ID" required autofocus>
		<input name = "Password" type="password" id="Password" class="form-control" placeholder="Пароль" required>
		<button name = "submit" class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
	</form>
</div>

<cfinclude template = "footer.cfm">
</cfif>