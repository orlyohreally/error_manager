<cfapplication name = "testing"
sessionTimeout = #CreateTimeSpan(0, 0, 60, 0)#
sessionManagement = "Yes">

<cfif not IsDefined("LoggedIn")>
	<cfset LoggedIn = "No">
<cfelse>

</cfif>