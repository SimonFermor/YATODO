<cfcomponent output="false">

<!--- loadData --->
<cffunction name="loadData" access="remote" returntype="query" returnformat="JSON" output="false">
	<cfargument name="start" type="string" default="1900-01-01">
	<cfargument name="end" type="string" default="2100-01-01">
	<cfargument name="activity_type_id" type="numeric" default="1">
	<cfargument name="activity_sub_type_id" type="numeric" default="1">
	
	<cfquery name="time_log" datasource="gtd">
		select time_log_id, start, finish, duration, title, task_id
		from time_log
		where activity_type_id = '#activity_type_id#'
		and activity_sub_type_id = '#activity_sub_type_id#'
		and start between cast('#start#' as date) and date_add(cast('#end#' as date), interval 1 day)
		order by start desc
	</cfquery>

	<cfreturn time_log>

</cffunction>

<!--- insertItem --->
<cffunction name="insertItem"  access="remote" returntype="query" returnformat="JSON" output="false">

	<cfreturn "{'result': 1">

</cffunction>

<!--- deleteItem --->
<cffunction name="deleteItem"  access="remote" returntype="string" returnformat="JSON" output="false">

	<cfset result = """Test">
	<cfreturn "{#result#: 1}">

</cffunction>

<!--- updateItem --->
<cffunction name="updateItem"  access="remote" returntype="string" returnformat="JSON" output="false">
	<cfargument name="time_log_id" type="string" required="yes">
	<cfargument name="start" type="string" required="no">
	<cfargument name="end" type="string" required="no">
	<cfargument name="activity_type_id" type="numeric" required="no">
	<cfargument name="activity_sub_type_id" type="numeric" required="no">
	<cfargument name="title" type="string" required="no">
	
	<cfif not isdefined("title")>
		<cfreturn "{result: 0}">
	<cfelse>
		<cfquery name="update" datasource="gtd">
			update time_log
			<cfif isdefined("title")>
			set title = '#title#'
			</cfif>
			where time_log_id = '#time_log_id#'
		</cfquery>
	</cfif>
	
	<cfreturn "{'result': 1}">
</cffunction>


</cfcomponent>