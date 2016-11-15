package student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import instructor.InstructorPageDataRecoverModel;

/**
 * Servlet implementation class PresenzaStudenteController
 */
@WebServlet("/PresenzaStudenteController")
public class PresenzaStudenteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PresenzaStudenteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("Chiamata DA UNO STUDENTE");
		String courseCode = (String) request.getSession().getAttribute("codice_corso");
		String cf = (String) request.getSession().getAttribute("cf");
		System.out.println(courseCode + "HEEEEEEEEY");
		System.out.println(cf);
		Boolean result = StudentDataRecoverModel.recoverAttendanceData(response, courseCode, cf);		
		if (result == false) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			//response.sendRedirect(request.getContextPath() + "/structure/errorpage.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
