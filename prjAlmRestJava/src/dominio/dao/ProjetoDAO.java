package dominio.dao;

import javax.persistence.EntityManager;

import controle.util.JpaDAO;
import dominio.Projeto;

public class ProjetoDAO extends JpaDAO<Projeto> {

	public ProjetoDAO() {
		super();
	}
	
	public ProjetoDAO(EntityManager manager) {
		super(manager);
	}
	
}
