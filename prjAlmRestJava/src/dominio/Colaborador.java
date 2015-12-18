package dominio;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class Colaborador {
	
	public Colaborador(int id, int codigo, String login, String nome, String sobrenome, String email) {
		super();
		this.id = id;
		this.codigo = codigo;
		this.login = login;
		this.nome = nome;
		this.sobrenome = sobrenome;
		this.email = email;
	}
	
	public Colaborador() {
		
	}

	@Id
	@GeneratedValue(generator = "COLABORADOR_ID", strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = "COLABORADOR_ID", sequenceName = "SEQ_COLABORADOR", allocationSize = 1)
	private int id;
	
	private int codigo;
	private String login;
	private String nome;
	private String sobrenome;
	private String email;
		
	public int getCodigo() {
		return codigo;
	}
	
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	
	public String getLogin() {
		return login;
	}
	
	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getSobrenome() {
		return sobrenome;
	}
	
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return this.nome;
	}
		
}
