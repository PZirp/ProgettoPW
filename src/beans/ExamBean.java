package beans;

public class ExamBean {
	private String Nome;
	private String Cognome;
	private String data;
	private String voto;
	private String codiceEsame;
	private String cf; 

	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getVoto() {
		return voto;
	}
	public void setVoto(String voto) {
		this.voto = voto;
	}
	
	public String getCf() {
		return cf;
	}
	public void setCf(String cf) {
		this.cf = cf;
	}
	public String getCodiceEsame() {
		return codiceEsame;
	}
	public void setCodiceEsame(String codiceEsame) {
		this.codiceEsame = codiceEsame;
	}
	
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getCognome() {
		return Cognome;
	}
	public void setCognome(String cognome) {
		Cognome = cognome;
	}
	
}
