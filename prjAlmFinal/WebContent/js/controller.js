var app = angular.module('app', []);

var url = 'http://localhost:8082/prjAlmRestJava/redmine/';

app.controller('projetoController', function($scope, $http){
	$http.get(url + 'projetos').success(function(response){
		$scope.listProjects = response.projects;
		$scope.totalProjetos = response.total_count;
	});
});

app.controller('tarefaController1', function($scope, $http){
	$http.get(url + 'tarefas').success(function(response){
		$scope.listIssues = response.issues;
		graficoTotalTarefas($scope.listIssues);
	});
});

app.controller('tarefaController2', function($scope, $http){
	$http.get(url + 'tarefas').success(function(response){
		$scope.listIssues = response.issues;
		$scope.totalTarefas = response.total_count;
		graficoTipoTarefas($scope.listIssues);
	});
});

app.controller('tarefaController3', function($scope, $http){
	$http.get(url + 'tarefas').success(function(response){
		$scope.listIssues = response.issues;
		var encontrou = 0;
		var totalTarefas=[];
		var totalTarefasColaborador=[];
		var tipoTarefas = [];
		var nomeColaborador=[];
		var idColaborador = [];
		var idTarefas = [];
		var dadosTabela = [];
		var aux = 0;
		var posicaoTarefa = 0;
		var posicaoColaborador = 0;
		var passaValor;
		var nomeProjeto;			
		var a = $scope.listIssues;
		
		var url = window.location.href;
		var parametrosDaUrl = url.split("cod=")[1];
		console.log(parametrosDaUrl);

		for (var i = 0; i < a.length; i++) {
			if(parametrosDaUrl == a[i].project.id){
				dadosTabela[aux++] = [a[i].subject,a[i].assigned_to.name,a[i].tracker.name, a[i].status.name, a[i].priority.name, a[i].estimated_hours,( a[i].estimated_hours / 8)];
				nomeProjeto = a[i].project.name;

				for(var cont = 0; cont < tipoTarefas.length; cont++){

					if(idTarefas[cont] == a[i].tracker.id){
						encontrou ++;
					}
				}

				if(encontrou == 0){				
					tipoTarefas[posicaoTarefa] = a[i].tracker.name;	
					idTarefas[posicaoTarefa++] = a[i].tracker.id;	

				}
				encontrou = 0;

				for(var cont =0; cont < nomeColaborador.length; cont++){

					if(idColaborador[cont] == a[i].assigned_to.id){
						encontrou ++;
					}
				}

				if(encontrou == 0){				
					nomeColaborador[posicaoColaborador] = a[i].assigned_to.name;	
					idColaborador[posicaoColaborador++] = a[i].assigned_to.id;	

				}
				encontrou = 0;
			}
		}

		for (var cont = 0; cont < idTarefas.length; cont++) {
			for (var i = 0; i < a.length; i++) {
				if((parametrosDaUrl == a[i].project.id)&&(idTarefas[cont] ==  a[i].tracker.id)){
					encontrou++;
				}
			}
			totalTarefas[cont] = encontrou;
			encontrou = 0;
		}

		for (var cont = 0; cont < idColaborador.length; cont++) {
			for (var i = 0; i < a.length; i++) {
				if((parametrosDaUrl == a[i].project.id)&&(idColaborador[cont] ==  a[i].assigned_to.id)){
					encontrou++;
				}
			}
			totalTarefasColaborador[cont] = encontrou;
			console.log(totalTarefasColaborador[cont]);
			encontrou = 0;
		}

		$scope.listar = dadosTabela;

		$scope.titulo= nomeProjeto;
		//console.log($scope.listar);
		drawChart3(tipoTarefas, totalTarefas);
		drawChart4(nomeColaborador, totalTarefasColaborador);
	});
});
