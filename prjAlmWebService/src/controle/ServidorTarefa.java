package controle;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/redmine")
public class ServidorTarefa {

	private CtrlTarefa ctrlTarefa = new CtrlTarefa();
	private CtrlProjeto ctrlProjeto = new CtrlProjeto();
	
	public ServidorTarefa() {
		super();
	}
	
	@GET
	@Path("/projetos")
	@Produces("application/json")
		public String projetos() {
		ctrlProjeto.novoProjeto();
		return ctrlProjeto.getProjetos();
	}
	
	@GET
	@Path("/tarefas")
	@Produces("application/json")
		public String tarefas() {
		ctrlTarefa.novaTarefa();
		return ctrlTarefa.getTarefas();
	}
		
}
