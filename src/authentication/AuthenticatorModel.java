package authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.Allievo;
import database.DBConnectionPool;

public class AuthenticatorModel {

	public AuthenticatorModel() {
		
	}
	
	public String authenticate(String username, String password) {
		String result = null;
		try {			
			String sql = "SELECT Role "
					+ "FROM Login_data "
					+ "WHERE Username = ? and Password = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("Errore, dati non trovati");
				return null;
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					result = rs.getString("Role");
					System.out.println(rs.getString("Role"));
				}
			}
			rs.close();
			pst.close();	
			DBConnectionPool.liberaConnessione(con);
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		return result;
	
	}
	
}
