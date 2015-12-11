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
	<script type="text/javascript" src="../js/totalTarefas.js"></script>
	<script type="text/javascript" src="../js/tipoTarefas.js"></script>
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
				<div class="col-lg-6">
					<div id="piechart"></div>
				</div>
				<div class="col-lg-6">
					<div id="tabela1"></div>
				</div>
			</div>

			<div class="row" ng-controller="projetoController">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Projetos encontrados ({{totalProjetos}})</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div style="max-height: 250px; overflow: auto;">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Id</th>
												<th>Nome</th>
												<th>Data de Abertura</th>
												<th>Última atualização</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="pr in listProjects" class="odd gradeX">
												<td>{{pr.id}}</td>
												<td><a href="projeto.jsp?cod={{pr.id}}">{{pr.name}}</a></td>
												<td>{{pr.created_on | date: 'dd/MM/yyyy'}}</td>
												<td>{{pr.updated_on | date: 'dd/MM/yyyy'}}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				
				<div ng-controller="tarefaController1"></div>
				
				<script type="text/javascript">
	           		
					google.load("visualization", "1", {
						packages : [ "corechart" ]
					});
					// google.setOnLoadCallback(drawChart);
					function drawChart(nomeProjeto, totalTarefaProjeto) {

						var nomeProjeto = nomeProjeto;
						var totalTarefaProjeto = totalTarefaProjeto;
						//  window.alert("aqui"+valor);

						var data = google.visualization.arrayToDataTable([
								nomeProjeto, totalTarefaProjeto ]);

						var options = {
							title : ' ',
							hAxis : {
								title : 'Total de tarefas por projeto',
								titleTextStyle : {
									color : 'red'
								}
							}
						};

						var chart = new google.visualization.ColumnChart(
								document.getElementById('tabela1'));
						chart.draw(data, options);
					}
				</script>
				
			</div>

			<div class="row" ng-controller="tarefaController2">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Tarefas encontradas ({{totalTarefas}})</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div style="max-height: 250px; overflow: auto;">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Colaborador</th>
											<th>Nome</th>
											<th>Tipo</th>
											<th>Status</th>
											<th>Prioridade</th>
											<th>Horas</th>
											<th>Dias</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="tf in listIssues" class="odd gradeX">
											<td>{{tf.assigned_to.name}}</td>
												<td>{{tf.subject}}</td>
												<td>{{tf.tracker.name}}</td>
												<td>{{tf.status.name}}</td>
												<td>{{tf.priority.name}}</td>
												<td>{{tf.estimated_hours}}</td>
												<td>{{tf.estimated_hours/8}}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<script type="text/javascript">
				 
					google.load("visualization", "1", {
						packages : [ "corechart" ]
					});
					google.setOnLoadCallback(drawChart1);

					function drawChart1(nomeProjeto, totalTarefaProjeto) {

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
							title : 'Porcentagem dos Tipos das Tarefas',
							is3D : true,
						};

							var chart = new google.visualization.PieChart(document.getElementById('piechart'));
						chart.draw(data, options);
					}
				</script>
				
			</div>

			

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