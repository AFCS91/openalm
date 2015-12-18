package controle;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import dominio.Tarefa;
import dominio.dao.TarefaDAO;

public class CtrlTarefa {

	private int id;
	private String titulo;
	private String tipo;
	private String prioridade;
	private String dtinicio;
	private String dtprevista;
	private int porcentagem;
	private double tpestimado;
	private int projeto;
	
	private Tarefa t;
	private TarefaDAO tarefaDAO = new TarefaDAO();
	
	private static RedmineRest r = new RedmineRest();
	
	public CtrlTarefa() {
		
	}
	
	public void novaTarefa() {
		try {
			JSONObject jsonObject = new JSONObject(r.redmineIssues());
			JSONArray issues = jsonObject.getJSONArray("issues");

			for (int i = 0; i < issues.length(); i++) {
				JSONObject json = issues.getJSONObject(i);

				id = json.getInt("id");
				titulo = json.getString("subject");
				JSONObject tracker = json.getJSONObject("tracker");
				tipo = tracker.getString("name");
				JSONObject priority = json.getJSONObject("priority");
				prioridade = priority.getString("name");
				dtinicio = json.getString("start_date");
				dtprevista = json.getString("due_date");
				porcentagem = json.getInt("done_ratio");
				tpestimado = json.getDouble("estimated_hours");
				JSONObject project = json.getJSONObject("project");
				projeto = project.getInt("id");

				t = new Tarefa(id, titulo, tipo, prioridade, dtinicio, dtprevista, porcentagem, tpestimado);
				tarefaDAO.salvar(t);
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}

	}
	
	public String getTarefas() {
		
		return r.redmineIssues();
		/*
		List<Tarefa> t = tarefaDAO.lerTodos();
		String tarefa = "";
		for (Tarefa texto : t) {
			tarefa += texto;
		System.out.println(tarefa);
		}
		return tarefa;
		*/
	}
	
}
