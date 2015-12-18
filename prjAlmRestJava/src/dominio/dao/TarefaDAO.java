package dominio.dao;

import javax.persistence.EntityManager;

import controle.util.JpaDAO;
import dominio.Tarefa;

public class TarefaDAO extends JpaDAO<Tarefa> {

	public TarefaDAO() {
		super();
	}
	
	public TarefaDAO(EntityManager manager) {
		super(manager);
	}
	
}
