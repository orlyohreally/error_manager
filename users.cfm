<cfif IsUserLoggedIn() eq "No">
	<cflocation url = "login.cfm">
<cfelse>
  <cfinclude template = "header.cfm">

    <cfquery name = "allUsers" datasource = "error_manager">
		select * from user
	</cfquery>
	<cfoutput query = "allUsers">
		<div class = "user">
			<b>Имя</b>: #FirstName#<br>
			<b>Фамилия</b>: #LastName#<br>
		</div>
	</cfoutput>
	<style>
		.user {
			border: 1px solid;
			padding:15px;
			margin: 20px;
			floate: left;
		}
	
	</style>
    
<cfinclude template = "footer.cfm">
</cfif>
