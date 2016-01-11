gtdApp.controller('ListController', ['$scope', '$http', '$location', function($scope, $http, $location) {
	$scope.start = '2015-11-01'; //$location.search().start;
	$scope.finish = '2015-10-30';
	$scope.title = 'Time Log';
	$scope.descending = false;
	
	$http.get('/gtd/cfc/data.cfc?method=loadData&start=' + $scope.start +'&finish=' + $scope.finish).success(function(cfdata) {
		$scope.column_names = cfdata.COLUMNS;
		$scope.selected_column = $scope.column_names[0].toLowerCase();
		var data_array = [];
		var column_name;
		for (var i=0; i<cfdata.DATA.length; i++) {
			var newobj = {};
			for (var j=0; j<cfdata.COLUMNS.length; j++) {
				column_name = cfdata.COLUMNS[j].toLowerCase();
				switch(column_name) {
					case 'duration':
						newobj[column_name] = moment(cfdata.DATA[i][j]).format('h [Hours] m [Minutes]');
						break;
					default:
						newobj[column_name] = cfdata.DATA[i][j];
				}

				data_array[i] = newobj;
			}
		}
		$scope.time_log = data_array;
	});
	
	$scope.change_order = function(i) {
		if ($scope.selected_column == i.toLowerCase()) {
			$scope.descending = !$scope.descending;
		}
		else {
			$scope.descending = false;
			$scope.selected_column = i.toLowerCase();
		}
	};
	
	$scope.column_icon = function(i) {
		if($scope.selected_column == i.toLowerCase()) {
			if($scope.descending) {
				return "fa fa-arrow-down";
			}
			else {
				return "fa fa-arrow-up";
			}
		}
		return "";
	};
}]);
