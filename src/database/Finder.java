package database;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;


public class Finder {

	public Finder() {}
	
	public 	Allievo find(String cf) {
		String result = null;
		Allievo allievo = new Allievo();
		try {			
			String sql = "SELECT Nome, Cognome "
					+ "FROM Allievo "
					+ "WHERE Codice_Fiscale = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, cf);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				result = "Allievo non trovato";
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					//result = rs.getString("Nome") + " " + rs.getString("Cognome") + "\n";
					allievo.setNome(rs.getString("Nome"));
					allievo.setCognome(rs.getString("Cognome"));
					
				}
			}
			rs.close();
			pst.close();			
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		return allievo;
	}
	
}
