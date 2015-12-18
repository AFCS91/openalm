<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="almrest">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ALM with AngularJS</title>
<script type="text/javascript" src="js/angular.min.js"></script>
</head>
<body ng-controller="redmineController">

<table cellpadding="4" cellspacing="4" border="1">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Descrição</th>
	</tr>
	<tr ng-repeat="pr in listProjects">
		<td>{{pr.id}}</td>
		<td>{{pr.name}}</td>
		<td>{{pr.description}}</td>
	</tr>
</table>

<script type="text/javascript">
	var alm = angular.module('almrest', []);
	alm.controller('redmineController', function($scope, $http){
		$http.get('http://localhost:8082/prjAlmRestJava/redmine/projects').success(function(response){
			$scope.listProjects = response.projects;
		});
	});
</script>

</body>
</html>