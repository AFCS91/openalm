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

		encontrou = 0;
		passaValor = totalTarefa;
		passaNome = tipoTarefas;
	}

	drawChart1(passaNome, passaValor);
}