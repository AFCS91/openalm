package dominio;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Tarefa {

	public Tarefa(int codigo, String titulo, String tipo, String prioridade,
			String dtinicio, String dtprevista, int porcentagem, double tpestimado) {
		super();
		this.codigo = codigo;
		this.titulo = titulo;
		this.tipo = tipo;
		this.prioridade = prioridade;
		this.dtinicio = dtinicio;
		this.dtprevista = dtprevista;
		this.porcentagem = porcentagem;
		this.tpestimado = tpestimado;
	}

	public Tarefa() {
		
	}
	
	@Id
	private int codigo;
	
	private String titulo;
	private String tipo;
	private String prioridade;
	private String dtinicio;
	private String dtprevista;
	private int porcentagem;
	private double tpestimado;
	
	@ManyToOne
	private Projeto projeto;
	
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getPrioridade() {
		return prioridade;
	}

	public void setPrioridade(String prioridade) {
		this.prioridade = prioridade;
	}

	public String getDtinicio() {
		return dtinicio;
	}

	public void setDtinicio(String dtinicio) {
		this.dtinicio = dtinicio;
	}

	public String getDtprevista() {
		return dtprevista;
	}

	public void setDtprevista(String dtprevista) {
		this.dtprevista = dtprevista;
	}

	public int getPorcentagem() {
		return porcentagem;
	}

	public void setPorcentagem(int porcentagem) {
		this.porcentagem = porcentagem;
	}

	public double getTpestimado() {
		return tpestimado;
	}

	public void setTpestimado(double tpestimado) {
		this.tpestimado = tpestimado;
	}
	
	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	@Override
	public String toString() {
		return this.titulo;
	}

}
