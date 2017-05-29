<cfif IsUserLoggedIn() eq "No">
	<cflocation url = "login.cfm">
<cfelse>
	<cfinclude template = "header.cfm">
	
	<cfif structKeyExists(form, 'submit')>
		<cfquery result = "result" datasource = "error_manager">
			insert into error (Date, Short_description, Long_description, Urgency_idUrgency, Importance_idImportance, User_idUser) values ('#DateFormat(Now(), 'yyyy-mm-dd')#', '#form.short_description#', '#form.long_description#', #form.Urgency#, #form.Importance#, #GetAuthUser()#);
		</cfquery>
		<cfquery datasource = "error_manager">
			insert into activity (Date,User_idUser, Error_idError) values ('#DateFormat(Now(), 'yyyy-mm-dd')#', #GetAuthUser()#, #result.generatedkey#);
		</cfquery>
		
		<cflocation url = "errors.cfm">
	</cfif>
	
	<div class="container">
      <form id = "new-error-form" action = "new_error.cfm" method = "post">
        <fieldset>
		<h2>Добавить новую ошибку</h2>
        <input type="text" name="short_description" class="form-control" placeholder="Короткое описание" required autofocus>
        <input type="text" name="long_description" class="form-control" placeholder="Подробное описание" required autofocus>
		
		<cfquery name = "getUrgency" datasource = "error_manager">
			SELECT * FROM error_manager.urgency;
		</cfquery>
		
		<cfif #getUrgency.RecordCount#>
			<select name = "Urgency" class = "selectpicker" title = "Срочность">
			<cfoutput query = "getUrgency">
					<option value = #idUrgency#>#Type#</option>
			</cfoutput>
			</select>
		</cfif>
		
		<cfquery name = "getImportance" datasource = "error_manager">
		SELECT * FROM error_manager.importance;
	</cfquery>
	
	<cfif #getImportance.RecordCount#>
		<select name = "Importance" class = "selectpicker" title = "Критичность">
		<cfoutput query = "getImportance">
				<option value = #idImportance#>#Type#</option>
		</cfoutput>
		</select>
	</cfif>
		
		<button name = "submit" id = "submit" class="btn btn-lg btn-primary btn-block" type="submit">Добавить</button>
		</fieldset>
	</form>
	
	<cfinclude template = "footer.cfm">
</cfif>