<cfif IsUserLoggedIn() eq "No">
	<cflocation url = "login.cfm">
<cfelse>
    <cfinclude template = "header.cfm">
	<cfif ((structKeyExists(url, "order")) and (url.order eq "ASC"))>
		<cfset url.order = "DESC">
	<cfelse>
		<cfset url.order = "ASC">
	</cfif>
	<cfif (not structKeyExists(url, "sorter"))>
		<cfset url.sorter = "idError">
		<cfset url.order = "DESC">
	</cfif>
	<cfquery name = "allErrors" datasource = "error_manager">
		SELECT idError, Date, LastName, FirstName, Short_description, Long_description, Urgency.Type as urgency, Status.Type as status, Importance.Type as importance
		FROM error_manager.error
		JOIN Urgency on Urgency_idUrgency = idUrgency
		JOIN Status on Status_idStatus = idStatus
		JOIN Importance on Importance_idImportance = idImportance
		JOIN User on User_idUser = idUser
		ORDER BY #url.sorter# #url.order#
	</cfquery>
	<cffunction name = nextLink>
		<cfargument name = "column" type = "string">
		<cfreturn "errors.cfm?sorter=" & column & "&order=" & url.order>
	</cffunction>
	<cffunction name = errorLink>
		<cfargument name = "idError" type = "integer">
		<cfreturn "error.cfm?id=" & idError>
	</cffunction>
	<div class="panel panel-default">
		<div class="panel-heading">Ошибки</div>
		<table class = "table">
		
			<tr>
				<th><a href = <cfoutput> #nextLink("idError")#</cfoutput>>Номер ошибки</a></th>
				<th><a href = <cfoutput> #nextLink("Short_description")#</cfoutput>>Краткое описание</a></th>
				<th><a href = <cfoutput> #nextLink("urgency")#</cfoutput>>Срочность</a></th>
				<th><a href = <cfoutput> #nextLink("status")#</cfoutput>>Статус</a></th>
				<th><a href = <cfoutput> #nextLink("importance")#</cfoutput>>Критичность</a></th>
				<th><a href = <cfoutput> #nextLink("LastName")#</cfoutput>>Пользователь</a></th>
				<th><a href = <cfoutput> #nextLink("Date")#</cfoutput>>Дата</a></th>
			</tr>
		<cfoutput query = "allErrors">
			
				<tr>
					<td><a href = <cfoutput> #errorLink(idError)#</cfoutput>>
					#idError#</a></td>
					<td>#Short_description#</td>
					<td>#urgency#</td>
					<td>#status#</td>
					<td>#importance#</td>
					<td>#LastName# #FirstName#</td>
					<td>#Date#</td>
					
				</tr>
			
		</cfoutput>
	</table>

<cfinclude template = "footer.cfm">
</cfif>