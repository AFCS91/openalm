package controle.util;

import java.util.List;

import javax.persistence.EntityManager;

public interface GenericoDAO<T> {
	public EntityManager getEntityManager();

	public T lerPorId(Object id);

	public List<T> lerTodos();

	public T salvar(T objeto);

	public void excluir(T objeto);

	public void abrirTransacao();

	public void gravarTransacao();

	public void desfazerTransacao();

}