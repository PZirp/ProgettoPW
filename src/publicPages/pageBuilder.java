package publicPages;

import database.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class pageBuilder {

	public pageBuilder() {
		
	}
	
	
	public HttpServletRequest buildPage(HttpServletRequest request, String page) {
		
		try {			
			String sql = "SELECT * "
					+ "FROM Attivita "
					+ "WHERE idAttivita = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, page);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("E' null");
				return null;
			} else {
				rs.absolute(1);
				System.out.print("\n");
				request.setAttribute("Descrizione1", rs.getString("Descrizione1"));
				request.setAttribute("Descrizione2", rs.getString("Descrizione2"));
				request.setAttribute("Descrizione3", rs.getString("Descrizione3"));
				request.setAttribute("Descrizione4", rs.getString("Descrizione4"));
				request.setAttribute("Titolo1", rs.getString("Titolo1"));
				request.setAttribute("Titolo2", rs.getString("Titolo2"));
				request.setAttribute("Titolo3", rs.getString("Titolo3"));
				request.setAttribute("Titolo4", rs.getString("Titolo4"));
				System.out.println(rs.getString("Descrizione1"));
				System.out.println(rs.getString("Descrizione2"));
				System.out.println(rs.getString("Descrizione3"));
				System.out.println(rs.getString("Descrizione4"));
				System.out.println(rs.getString("Titolo1"));
				System.out.println(rs.getString("Titolo2"));
				System.out.println(rs.getString("Titolo3"));
				System.out.println(rs.getString("Titolo4"));
			}
			rs.close();
			pst.close();			
			DBConnectionPool.liberaConnessione(con);
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		return request;
	}
	
	public static void main(String[] args) {
		
		// OK
		try {			
			String sql = "SELECT * "
					+ "FROM Attivita "
					+ "WHERE idAttivita = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, "mainpage");
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
			} else {
				rs.absolute(1);
				System.out.print("\n");
				System.out.println(rs.getString("Descrizione1"));
				System.out.println(rs.getString("Descrizione2"));
				System.out.println(rs.getString("Descrizione3"));
				System.out.println(rs.getString("Descrizione4"));
				System.out.println(rs.getString("Titolo1"));
				System.out.println(rs.getString("Titolo2"));
				System.out.println(rs.getString("Titolo3"));
				System.out.println(rs.getString("Titolo4"));
			}
			rs.close();
			pst.close();			
			DBConnectionPool.liberaConnessione(con);
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		
		
	}
}
