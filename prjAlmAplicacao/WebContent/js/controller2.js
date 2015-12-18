var app = angular.module('app', []);

var url = 'http://localhost:8082/prjAlmRestJava/redmine/';

app.controller('projetoController', function($scope, $http){
	$http.get(url + 'projetos').success(function(response){
		$scope.listProjects = response.projects;
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
		graficoTipoTarefas($scope.listIssues);
	});
});

app.controller('tarefaController3', function($scope, $http){
	$http.get(url + 'tarefas').success(function(response){
		$scope.listIssues = response.issues;
		graficoTarefas($scope.listIssues);
	});
});

function graficoTotalTarefas(arrayJson){
	var b = arrayJson;
	var idProjeto = [];
	var nomeProjeto = [];
	var totalTarefaProjeto = [];
	var posicao = 0;
	var encontrou = 0;

	for (var i = 0; i < b.length; i++){
		if (i == 0){
			idProjeto[posicao] = b.length;
			nomeProjeto[posicao++] = 'Total Tarefas';
			totalTarefaProjeto[0]= b.length;
		}

		for (var cont = 0; cont < idProjeto.length; cont++){
			if (idProjeto[cont] == b[i].project.id){
				encontrou++;
				break;
			}
		}

		if(encontrou == 0){
			idProjeto[posicao] = b[i].project.id;
			nomeProjeto[posicao++] =b[i].project.name;

			encontrou = 0;
		}else
			encontrou = 0;
	}

	for (var cont = 1; cont < idProjeto.length; cont++){
		for (var i = 0; i < b.length; i++){
			if (idProjeto[cont] == b[i].project.id){
				encontrou++;
			}
		}
		totalTarefaProjeto[cont] = encontrou;
		encontrou = 0;
	}

	drawChart(nomeProjeto, totalTarefaProjeto);
}

function graficoTipoTarefas(arrayJson){
	var c = arrayJson;
	var idTarefas = [];
	var tipoTarefas = [];
	var totalTarefa = [];
	var encontrou = 0;
	var posicao = 0;
	var passaValor = 1;
	var passaNome;


	for (var i = 0; i < c.length; i++){
		if (i == 0){
			idTarefas[posicao] = 1;
			tipoTarefas[posicao++] = 'Defeito';
		}

		for (var cont = 0; cont < idTarefas.length; cont++){
			if (idTarefas[cont] == c[i].tracker.id){
				encontrou++;
				break;
			}
		}
		if(encontrou == 0){
			idTarefas[posicao] = c[i].tracker.id;
			tipoTarefas[posicao++] =c[i].tracker.name;

			encontrou = 0;
		}else
			encontrou = 0;

	}

	for (var cont = 0; cont < idTarefas.length; cont++){
		for (var i = 0; i < c.length; i++){
			if (idTarefas[cont] == c[i].tracker.id){
				encontrou++;
			}
		}
		totalTarefa[cont] = encontrou;

		encontrou =0;
		passaValor =totalTarefa;
		passaNome =tipoTarefas;
	}

	drawChart1(passaNome,passaValor);
}

function graficoTarefas(arrayJson) {
	var url = window.location.href;
	var parametrosDaUrl = url.split("cod=")[1];
	console.log(parametrosDaUrl);
	
	var encontrou = 0;
	var totalTarefas=[];
	var tipoTarefas = [];
	var nomeColaborador=[];
	var idColaborador = [];
	var idTarefas = [];
	var dadosTabela = [];
	var aux = 0;
	var posicao = 0;
	var passaValor;
	var nomeProjeto;			
	var d = arrayJson;
	
	for (var i = 0; i < d.length; i++) {
		if(parametrosDaUrl == d[i].project.id){
		//	dadosTabela[aux++] = [a[i].subject,a[i].tracker.name, a[i].status.name, a[i].priority.name, a[i].estimated_hours,( a[i].estimated_hours / 8)];
				dadosTabela[aux++] = [d[i].subject,d[i].assigned_to.name,d[i].tracker.name, d[i].status.name, d[i].priority.name, d[i].estimated_hours,( d[i].estimated_hours / 8)];
		
			nomeProjeto = 	d[i].project.name;
			for(var cont =0; cont < tipoTarefas.length; cont++){
				
				if(idTarefas[cont] == d[i].tracker.id){
					encontrou ++;
					
				}
			}
		
			if(encontrou == 0){				
				tipoTarefas[posicao] = d[i].tracker.name;	
				idTarefas[posicao++] = d[i].tracker.id;	
			}
			encontrou = 0;
		}
	}
		
	for (var cont = 0; cont < idTarefas.length; cont++) {
		for (var i = 0; i < d.length; i++) {
			if((parametrosDaUrl == d[i].project.id)&&(idTarefas[cont] ==  d[i].tracker.id)){
				nomeColaborador =  d[i].assigned_to.name;
				idColaborador =  d[i].assigned_to.id;
				encontrou++;
			}
		}
		totalTarefas[cont] = encontrou;
		encontrou = 0;

	}
	
	$scope.listar = dadosTabela;
	$scope.titulo= nomeProjeto;
	console.log($scope.listar);
	
	drawChart(tipoTarefas,totalTarefas);
	
}