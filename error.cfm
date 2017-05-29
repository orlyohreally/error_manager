<cfif IsUserLoggedIn() eq "No">
	<cflocation url = "login.cfm">
<cfelse>
<cfinclude template = "header.cfm">
<cfif (not structKeyExists(url, "id") or (structKeyExists(url, "id") && url.id eq ""))>
	<cflocation url = "errors.cfm">
</cfif>
<div class = "container">
	<cfquery name = "Error" datasource = "error_manager">
		SELECT idError, Date, LastName, FirstName, Short_description, Long_description, Urgency.Type as urgency, Status.Type as status, idStatus, Importance.Type as importance
		FROM error_manager.error
		JOIN Urgency on Urgency_idUrgency = idUrgency
		JOIN Status on Status_idStatus = idStatus
		JOIN Importance on Importance_idImportance = idImportance
		JOIN User on User_idUser = idUser
		WHERE idError = #url.id#
	</cfquery>
	<cfif #Error.RecordCount#>
		<cfoutput query = "Error">
			<div class="panel panel-default">
				  <div class="panel-heading">Ошибка номер <b>#idError#</b></div>
				  <div class="panel-body">
					<b>Номер ошибки: </b> #idError#<br>
					<b>Краткое описание: </b>#Short_description#<br>
					<b>Подробное описание: </b>#Long_description#<br>
					<b>Срочность: </b>#urgency#<br>
					<b>Статус: </b>#status#<br>
					<cfset errorStatus = #idStatus#>
					<b>Критичность: </b>#importance#<br>
					<b>Пользователь: </b>#LastName# #FirstName#<br>
					<b>Дата: </b>#Date#<br>
				  </div>
			</div>
			<cfquery name = "Activity" datasource = "error_manager">
				SELECT Comment, Date, Type, LastName, FirstName FROM error_manager.activity
				JOIN action on idAction = Action_idAction
				JOIN user on idUser = User_idUser
				WHERE Error_idError = #url.id#
				ORDER BY Date DESC;
			</cfquery>
		</cfoutput>
			<cfif #Activity.RecordCount#>
			<div class="panel panel-default">
				<div class="panel-heading">История изменения</div>
				<table class = "table">
				
					<tr>
						<th>Комментарий</th>
						<th>Пользователь</th>
						<th>Действие</th>
						<th>Дата</th>
					</tr>
					<cfoutput query = "Activity">
						<tr>
							<td>#Comment#</td>
							<td>#LastName# #FirstName#</td>
							<td>#Type#</td>
							<td>#Date#</td>
							
						</tr>
					
					</cfoutput>
				</table>
			</cfif>
			
			<a href = "errors.cfm"><div class="btn btn-lg btn-primary btn-errors">Список всех ошибок</div></a>
			<cfquery name = "getStatus" datasource = "error_manager">
				SELECT Status_idStatus1, Type FROM error_manager.status_has_status
				JOIN error_manager.status on idStatus = Status_idStatus1
				WHERE Status_idStatus = #errorStatus#;
			</cfquery>
			<cfif #getStatus.RecordCount#>
			<a href = update_error.cfm?id=<cfoutput>#url.id#</cfoutput>><div class="btn btn-lg btn-primary btn-edit-error">Редактировать ошибку</div></a>
			</cfif>
			
		
	<cfelse>
		<cflocation url = "errors.cfm">
	</cfif>
	
</div>
<cfinclude template = "footer.cfm">
</cfif>