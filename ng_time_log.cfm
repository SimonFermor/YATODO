<!doctype html>
<html lang="en" ng-app="gtdApp">
<!-- Applied to html element as this is entirely Angular -->
<head>
	<meta charset="UTF-8">
	<title>Time Log</title>

	<link href="/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="/lib/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
  
	<link rel="stylesheet" href="/lib/font-awesome/css/font-awesome.min.css">

	<script src="/lib/jquery/jquery-1.11.1.js"></script>
  
	<script src="/lib/angular/angular.js"></script>
	<script src="/lib/angular/angular-route.js"></script>
	<script src="/lib/angular/angular-animate.js"></script>

	<script src="/lib/moment/moment.js"></script>

	<script>
		var start = <cfoutput>"#start#"</cfoutput>
	</script>
	
	<script src="js/app.js"></script>
	<script src="js/controllers.js"></script>

	<link href="css/gtd.css" rel="stylesheet">
	
</head>

<body ng-controller="ListController">
<div class="">
	<div>
	<div>{{title}} Sort Column: <b>{{selected_column}}</b><div>
	<div>Start Date: {{start}}</div>
	<div>Finish Date: <input type="date">{{finish}}</input></div>
	</div>
	<div class="">
	<div class="input-group">
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th ng-click="change_order(i)" ng-repeat="i in column_names">{{i}}
					<i ng-class="column_icon(i)"></i>
				</th>
			</tr>
		</thead>
		<tr ng-repeat="item in time_log | orderBy: selected_column: descending">
			  <td>{{item.time_log_id}}</td>
			  <td>{{item.start}}</td>
			  <td>{{item.finish}}</td>
			  <td>{{item.duration}}</td>
			  <td>{{item.title}}</td>
			  <td>{{item.task_id}}</td>
		</tr>
	</table> 
	</div>
</div>
</body>
</html>