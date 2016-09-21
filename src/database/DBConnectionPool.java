package database;

import java.sql.*;
import java.util.List;
import java.util.LinkedList;

public class DBConnectionPool {
	
	private static List<Connection> connessioniLibere;
	
	public static void ConnectionPool() { 
	
		connessioniLibere = new LinkedList<Connection>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (ClassNotFoundException e) {
			System.out.println("Impossibile trovare il driver per il database");
		}
	}
	
	private static Connection creaConnessione() throws SQLException {			
		String url = "jdbc:mysql://localhost:3306/palestradb2";
		Connection nuovaConnessione = DriverManager.getConnection(url, "root", "73truenath");
		System.out.println(("Connessione riuscita"));
		nuovaConnessione.setAutoCommit(false);
		return nuovaConnessione;		
	}
	
	public static Connection getConnection() throws SQLException {
		Connection connessione;
		
		if (!connessioniLibere.isEmpty()) {
			connessione = (Connection) connessioniLibere.get(0);
			connessioniLibere.remove(0);
			
			try {
				if (connessione.isClosed()) {
					connessione = getConnection();
				}
			}
			catch (SQLException e) {
				connessione = getConnection();
			}
		}
		else connessione = creaConnessione();
		
		return connessione;
	}
	
	public static void liberaConnessione(Connection connessione) {
		connessioniLibere.add(connessione);
	}
}