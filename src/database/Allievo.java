package database;

import java.util.ArrayList;
import java.util.Scanner;

import com.google.gson.Gson;

public class Allievo {

	private String nome;
	private String cognome;
	
	public Allievo() {
		
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
}
