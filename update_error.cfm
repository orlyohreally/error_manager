<cfif IsUserLoggedIn() eq "No">
	<cflocation url = "login.cfm">
<cfelse>
    <cfinclude template = "header.cfm">
	<cfif (not structKeyExists(url, "id") or (structKeyExists(url, "id") && url.id eq ""))>
		<cflocation url = "errors.cfm">
	</cfif>
	<cfif structKeyExists(form, "submit")>
		<cfquery datasource = "error_manager">
		UPDATE error_manager.error
		SET
		Status_idStatus = #form.Status#
		WHERE idError = #url.id#;
		</cfquery>
		<cfquery datasource = "error_manager">
			insert into activity (Date,User_idUser, Error_idError, Action_idAction, Comment) values ('#DateFormat(Now(), 'yyyy-mm-dd')#', #GetAuthUser()#, #url.id#, #form.Status#, '#form.comment#');
		</cfquery>
		srtctClear(form)
		<cflocation url = "error.cfm?id=#url.id#">
		
	</cfif>
	<cfquery name = "Error" datasource = "error_manager">
		SELECT idError, Date, LastName, FirstName, Short_description, Long_description, Urgency_idUrgency as urgency, Status_idStatus as status, Importance_idImportance as importance
		FROM error_manager.error
		JOIN User on User_idUser = idUser
		WHERE idError = #url.id#
	</cfquery>
	
	<cfif #Error.RecordCount#>
		<cfoutput query = "Error">
			<cfset errorStatusId = #status#>
			<div class="container">
			  <form action = "" method = "post">
				<fieldset>
				<h2>Редактировать ошибку номер #id#</h2>
				<input type="text" disabled = true name="short_description" class="form-control" value = #Short_description# required autofocus>
				<textarea rows = 5 disabled = true name="long_description" class="form-control" required autofocus>#Long_description# </textarea>
				<textarea rows = 5 name = "comment" placeholder = "Комментарий" class="form-control" required autofocus></textarea>
		</cfoutput>
		
		
		<cfquery name = "getStatus" datasource = "error_manager">
			SELECT Status_idStatus1, Type FROM error_manager.status_has_status
			JOIN error_manager.status on idStatus = Status_idStatus1
			WHERE Status_idStatus = #errorStatusId#;
		</cfquery>
		<cfif #getStatus.RecordCount#>
			<div id = Status>
			<cfoutput query = "getStatus">
				<input type = "radio" checked = true name = "status" value = #Status_idStatus1#>#Type#</input>
			</cfoutput>
			</div>
		<cfelse>
			<cflocation url = "errors.cfm">
		</cfif>	
			<button name = "submit" id = "submit" class="btn btn-lg btn-primary btn-block" type="submit">Редактировать</button>
			</fieldset>
		</form>
		
	</cfif>
	
<cfinclude template = "footer.cfm">
</cfif>