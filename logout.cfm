<cfif IsUserLoggedIn() eq "No">
	<cflocation url = "login.cfm">
<cfelse>
<cfinclude template = "header.cfm">
<cfif IsUserLoggedIn() eq "Yes">
	<cflogout>
</cfif>
<cflocation url = "login.cfm">
<cfinclude template = "footer.cfm">
</cfif>