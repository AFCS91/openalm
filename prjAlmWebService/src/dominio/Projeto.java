package dominio;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Projeto {
	
	public Projeto(int codigo, String nome, String descricao, String dtcriacao) {
		super();
		this.codigo = codigo;
		this.nome = nome;
		this.descricao = descricao;
		this.dtcriacao = dtcriacao;
	}
	
	public Projeto() {
		
	}
	
	@Id
	private int codigo;
	
	private String nome;
	private String descricao;
	private String dtcriacao;
	
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDtcriacao() {
		return dtcriacao;
	}

	public void setDtcriacao(String dtcriacao) {
		this.dtcriacao = dtcriacao;
	}
	
	@Override
	public String toString() {
		return this.nome;
	}
			
}
