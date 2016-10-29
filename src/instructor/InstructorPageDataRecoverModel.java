package instructor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import database.DBConnectionPool;

public class InstructorPageDataRecoverModel {

	public static Boolean retrieveInstructorData(HttpServletRequest request, String username) {
		String cf = null;
		try {			
			String sql = "SELECT * "
					+ "FROM Login_data join login_istruttore on Username = Login_data_Username join istruttore on Istruttore_Codice_Fiscale = Codice_Fiscale "
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
					request.setAttribute("id", rs.getString("ID_Federale"));
					request.setAttribute("grado", rs.getString("Grado"));
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
					+ "FROM Tiene join Corso on Tiene.Codice_Corso = Corso.Codice_Corso "
					+ "WHERE Codice_Fiscale = ?";
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
					request.setAttribute("max_iscritti", rs.getString("Num_max_iscritti"));
					request.setAttribute("mum_iscritti", rs.getString("Num_Iscritti"));
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
	
	public static Boolean recoverLessonList(HttpServletResponse response, String codCorso) throws IOException {
		try {			
			ArrayList<LessonBean> list = new ArrayList<>();
			String sql = "SELECT `Codice Lezione`, Data FROM Lezione WHERE CodCorso = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, codCorso);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("Errore, dati non trovati");
				return false;
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					LessonBean temp = new LessonBean();
					temp.setCodiceLezione(rs.getString("Codice Lezione"));
					temp.setData(rs.getString("Data"));
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
	
	public static Boolean recoverAttendanceData(HttpServletResponse response, String codLezione, String codCorso) throws IOException {
		try {			
			ArrayList<AttendanceBean> list = new ArrayList<>();
			String sql = "SELECT Nome, Cognome, Presente, Codice_Fiscale FROM (Lezione join Presenze on CodCorso = Lezione_CodCorso "
					+ "and `Codice Lezione` = Lezione_Codice_Lezione)  join Allievo on Allievo_Codice_Fiscale = Codice_Fiscale "
					+ "WHERE CodCorso = ? and Lezione_Codice_Lezione = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, codCorso);
			pst.setString(2, codLezione);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("Errore, dati non trovati");
				return false;
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					AttendanceBean temp = new AttendanceBean();
					temp.setNome(rs.getString("Nome"));
					temp.setCognome(rs.getString("Cognome"));
					temp.setCodiceFiscale(rs.getString("Codice_Fiscale"));
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
	
	public static Boolean retrieveStudentsData(HttpServletResponse response, String codCorso) throws IOException {
		try {			
			System.out.println(codCorso);
			ArrayList<AttendanceBean> list = new ArrayList<>();
			String sql = "SELECT Allievo.Nome, Allievo.Cognome, Allievo.Codice_Fiscale FROM (Corso join Frequenta on Codice_Corso = Corso_Codice_Corso)"
					+ " join Allievo on Allievo_Codice_Fiscale = Codice_Fiscale "
					+ "WHERE Codice_Corso = ?";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, codCorso);
			ResultSet rs = pst.executeQuery();
			if (!rs.first()) {
				System.out.println("Errore, dati non trovati");
				return false;
			} else {
				rs.absolute(0);
				System.out.print("\n");
				while (rs.next()) {
					AttendanceBean temp = new AttendanceBean();
					temp.setNome(rs.getString("Nome"));
					temp.setCognome(rs.getString("Cognome"));
					temp.setCodiceFiscale(rs.getString("Codice_Fiscale"));
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
	
	public static Boolean createLesson(String JSONData, String date, String codCorso) throws IOException {
		try {	
			String codLez = "";
			DBConnectionPool.ConnectionPool();
			Connection con = DBConnectionPool.getConnection();
			String sql = "SELECT * FROM Lezione where Data = ? and CodCorso = ?";
			PreparedStatement pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			System.out.println("Statement preparato");
			pst.setString(1, date);
			pst.setString(2, codCorso);
			System.out.println("Impostata data");
			ResultSet rs = pst.executeQuery();
			if (rs.first()) {
				//Una lezione con la stessa data esiste già
				System.out.println("Lezione esistente");
				return false;
			}			
			//Crea la lezione
			System.out.println("Creo lezione");
			sql = "INSERT INTO Lezione(CodCorso, Data) "
					+ "VALUES(?,?)";
			pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, codCorso);
			System.out.println("CodCorso settato");
			pst.setString(2, date);
			System.out.println("Data settata");
			pst.executeUpdate();

			//Recupera il codice della lezione
			
			sql = "SELECT `Codice Lezione` FROM Lezione where Data = ?";
			pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, date);
			rs = pst.executeQuery();
			if (rs.first()) {
				codLez = rs.getString("Codice Lezione");
			} else {
				return false;
			}
			System.out.println("Il codice della lezione appena creata è: " + codLez);
			// Inserisce i dati
			//con.commit();

			System.out.println(JSONData);
			Gson gson = new Gson();
			AttendanceBean[] data = gson.fromJson(JSONData, AttendanceBean[].class);
			sql = "INSERT INTO Presenze(Allievo_Codice_Fiscale, Lezione_CodCorso, Lezione_Codice_Lezione, Presente) VALUES(?,?,?, ?)";
			pst = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			System.out.println("Prima del loop");
			for (int i = 0; i < data.length; i++) {
				System.out.println("Nel loop");
				System.out.println(data[i].getCodiceFiscale());
					pst.setString(1, data[i].getCodiceFiscale());
					pst.setString(2, codCorso);
					pst.setString(3, codLez);
					pst.setString(4, data[i].getPresente());

					pst.addBatch();
			}
			pst.executeBatch();
			con.commit();
			rs.close();
			pst.close();
			DBConnectionPool.liberaConnessione(con);
			return true;
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		
		return false;
	}	
}