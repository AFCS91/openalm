<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt" ng-app="app">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>OpenALM</title>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="../dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<!-- <link href="../bower_components/morrisjs/morris.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link href="../bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="../js/angular.min.js"></script>
	<!-- <script type="text/javascript" src="../js/projetos.js"></script> -->
	<script type="text/javascript" src="../js/controller.js"></script>
	<script type="text/javascript" src="../js/googlechart.js"></script>
	
</head>

<body>

	<div id="wrapper">

		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">OpenALM</a>
		</div>

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">

					<li><a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i>
							Projetos e Tarefas</a></li>

				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Dashboard</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div ng-controller="tarefaController3">
							
						
							<h2 ng-bind="titulo">{{titulo}}</h2>
							<!--  
							<ol class="breadcrumb">
								<li class="active"><i class="fa fa-dashboard"></i> Projetos</li>
							</ol>
							-->
							<div style="max-height: 250px; overflow: auto;">

								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Nome</th>
											<th>Colaborador</th>
											<th>Tipo</th>
											<th>Status</th>
											<th>Prioridade</th>
											<th>Horas</th>
											<th>Dias</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="pr in listar" class="odd gradeX">
											<td>{{pr[0]}}</td>
											<td>{{pr[1]}}</td>	
											<td>{{pr[2]}}</td>
											<td>{{pr[3]}}</td>
											<td>{{pr[4]}}</td>
											<td>{{pr[5]}}</td>
											<td>{{pr[6]}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
				
			</div>
			</div>
				<div class="row">
					<div class="col-lg-6">
						<div id="piechart" style="width: 500px; height: 300px;"></div>
					</div>
					<div class="col-lg-6">
						<div id="piechart1" style="width: 500px; height: 300px;"></div>
					</div>
				</div>
				<script type="text/javascript">
		      
					google.load("visualization", "1", {
						packages : [ "corechart" ]
					});
					google.setOnLoadCallback(drawChart3);

					function drawChart3(nomeProjeto, totalTarefaProjeto) {

						var nomeProjeto = nomeProjeto;
						var totalTarefaProjeto = totalTarefaProjeto;

						var data = new google.visualization.DataTable();
						data.addColumn('string', 'Task');
						data.addColumn('number', 'Hours per Day');

						for (var i = 0; i < nomeProjeto.length; i++) {

							data.addRows([ [ nomeProjeto[i],
									totalTarefaProjeto[i] ] ]);

						}

						var options = {
							title : 'Total de Tarefas',
							is3D : true,
						};
						
						var chart = new google.visualization.PieChart(document
								.getElementById('piechart'));

						chart.draw(data, options);
					}
				</script>
		    			
			<script type="text/javascript">
			
				google.load("visualization", "1", {
					packages : [ "corechart" ]
				});
				google.setOnLoadCallback(drawChart4);

				function drawChart4(nomeProjeto, totalTarefaProjeto) {

					var nomeProjeto = nomeProjeto;
					var totalTarefaProjeto = totalTarefaProjeto;

					var data = new google.visualization.DataTable();
					data.addColumn('string', 'Task');
					data.addColumn('number', 'Hours per Day');

					for (var i = 0; i < nomeProjeto.length; i++) {

						data.addRows([[nomeProjeto[i], totalTarefaProjeto[i]]]);

					}

					var options = {
						title : 'Total de Tarefas',
						is3D : true,
					};

					var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

					chart.draw(data, options);
				}
			</script>
			
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="../bower_components/raphael/raphael-min.js"></script>
	<!--<script src="../bower_components/morrisjs/morris.min.js"></script> -->
	<!--  <script src="../js/morris-data.js"></script> -->

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>
	
</body>

</html>