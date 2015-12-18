package controle;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import dominio.Projeto;
import dominio.dao.ProjetoDAO;

public class CtrlProjeto {

	private int codigo;
	private String nome;
	private String descricao;
	private String dtcriacao;
	
	private Projeto p;
	private ProjetoDAO projetoDAO = new ProjetoDAO();
	
	private static RedmineRest r = new RedmineRest();
	
	public CtrlProjeto() {
		
	}
	
	public void novoProjeto() {
		try {
			JSONObject jsonObject = new JSONObject(r.redmineProjects());
			JSONArray projects = jsonObject.getJSONArray("projects");

			for (int i = 0; i < projects.length(); i++) {
				JSONObject json = projects.getJSONObject(i);

				codigo = json.getInt("id");
				nome = json.getString("name");
				descricao = json.getString("description");
				dtcriacao = json.getString("created_on");
				
				p = new Projeto(codigo, nome, descricao, dtcriacao);
				projetoDAO.salvar(p);
				
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}

	}
	
	public String getProjetos() {
		return r.redmineProjects();
	}
	
}
