package dominio.dao;

import javax.persistence.EntityManager;

import controle.util.JpaDAO;
import dominio.Colaborador;

public class ColaboradorDAO extends JpaDAO<Colaborador> {

	public ColaboradorDAO() {
		super();
	}
	
	public ColaboradorDAO(EntityManager manager) {
		super(manager);
	}
	
}
