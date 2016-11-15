package beans;

public class AttendanceBean {
	private String nome;
	private String cognome;
	private String presente;
	private String codiceFiscale; 
	private String date;
	
	public AttendanceBean() {}
	
	public String getCodiceFiscale() {
		return codiceFiscale;
	}
	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getPresente() {
		return presente;
	}
	public void setPresente(String presente) {
		this.presente = presente;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	} 
	
}