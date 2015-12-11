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