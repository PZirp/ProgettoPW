package student;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import instructor.InstructorPageDataRecoverModel;

/**
 * Servlet implementation class StudentPage
 */
@WebServlet("/StudentPage")
public class StudentPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		if (session.getAttribute("nome") == null) {
			Boolean result = StudentDataRecoverModel.retrieveStudentData(request, (String) request.getSession().getAttribute("username"));
			if (result == false) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}
			session.setAttribute("nome", request.getAttribute("nome"));
			session.setAttribute("cognome", request.getAttribute("cognome"));
			session.setAttribute("corso", request.getAttribute("corso"));
			session.setAttribute("data_iscrizione", request.getAttribute("data_iscrizione"));
			session.setAttribute("grado", request.getAttribute("grado"));
			session.setAttribute("codice_corso", request.getAttribute("codice_corso"));
			session.setAttribute("nome_corso", request.getAttribute("nome_corso"));
			session.setAttribute("cf", request.getAttribute("cf"));
			session.setAttribute("sede", request.getAttribute("sede"));		
		} 
		RequestDispatcher rd = request.getRequestDispatcher(response.encodeURL("/structure/studentPages/StudentPage.jsp"));
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
