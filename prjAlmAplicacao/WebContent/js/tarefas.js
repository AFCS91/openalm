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
	var $scope;

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

	//$scope.listar = dadosTabela;
	//$scope.titulo= nomeProjeto;
	//console.log($scope.listar);

	drawChart2(tipoTarefas, totalTarefas);

}