package student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.AttendanceBean;
import beans.ExamBean;
import database.DBConnectionPool;

public class StudentDataRecoverModel {

	public static Boolean retrieveStudentData(HttpServletRequest request, String username) {
		String cf = null;
		try {			
			String sql = "SELECT * "
					+ "FROM Login_data join login_allievo on Username = Login_data_Username join allievo on Allievo_Codice_Fiscale = Codice_Fiscale "
					+ "WHERE Username = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, username);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("Errore, dati non trovati");
				return false;
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					request.setAttribute("nome", rs.getString("Nome"));
					request.setAttribute("cognome", rs.getString("Cognome"));
					request.setAttribute("grado", rs.getString("Grado"));
					request.setAttribute("data_iscrizione", rs.getString("Data_iscrizione"));
					request.setAttribute("cf", rs.getString("Codice_Fiscale"));
					cf = rs.getString("Codice_Fiscale");
				}
			}
			System.out.println(cf);
			rs.close();
			pst.close();
			DBConnectionPool.liberaConnessione(con);
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		
		try {			
			String sql = "SELECT * "
					+ "FROM Corso join Frequenta on Frequenta.Corso_Codice_Corso = Corso.Codice_Corso "
					+ "WHERE Allievo_Codice_Fiscale = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, cf);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("Errore, dati non trovati");
				return false;
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					request.setAttribute("codice_corso", rs.getString("Codice_corso"));
					request.setAttribute("nome_corso", rs.getString("Nome"));
					request.setAttribute("sede", rs.getString("Sede"));					
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
		
		return true;
	}
	
	public static Boolean recoverAttendanceData(HttpServletResponse response, String codCorso, String cf) throws IOException {
		try {			
			ArrayList<AttendanceBean> list = new ArrayList<>();
			String sql = "select * from presenze join lezione on Lezione_CodCorso = CodCorso and Lezione_Codice_Lezione = `Codice Lezione` "
					+ "where CodCorso = ? and Allievo_Codice_Fiscale = ?"; 
					
					
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, codCorso);
			pst.setString(2, cf);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("Errore, dati non trovati");
				return false;
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					AttendanceBean temp = new AttendanceBean();
					temp.setDate(rs.getString("Data"));
					temp.setPresente(rs.getString("Presente"));
					list.add(temp);
				}
				Gson gson = new Gson();
				String json = gson.toJson(list);
				response.getWriter().write(json);
				System.out.println(json);
			}
			rs.close();
			pst.close();
			DBConnectionPool.liberaConnessione(con);
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		
		return true;
	}	
	
	public static Boolean recoverExamData(HttpServletResponse response, String codCorso, String cf) throws IOException {
		try {			
			ArrayList<ExamBean> list = new ArrayList<>();
			String sql = "Select Data, Voto from sostiene join esame on Corso_Codice_Corso = Esame_Corso_Codice_Corso "
					+ "and ID_Esame = Esame_ID_Esame where Corso_Codice_Corso = ? and Allievo_Codice_Fiscale = ?";					
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, codCorso);
			pst.setString(2, cf);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("Errore, dati non trovati??");
				return false;
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					ExamBean temp = new ExamBean();
					System.out.println("Esami trovati");
					System.out.println(rs.getString("Data"));
					System.out.println(rs.getString("Voto"));
					temp.setData(rs.getString("Data"));
					temp.setVoto(rs.getString("Voto"));
					list.add(temp);
				}
				Gson gson = new Gson();
				String json = gson.toJson(list);
				response.getWriter().write(json);
				System.out.println(json);
			}
			rs.close();
			pst.close();
			DBConnectionPool.liberaConnessione(con);
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		return true;
	}	
}
