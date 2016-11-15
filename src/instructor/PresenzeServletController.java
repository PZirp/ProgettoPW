package instructor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PresenzeServlet
 */
@WebServlet("/PresenzeServlet")
public class PresenzeServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PresenzeServletController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Chiamata");
		String courseCode = (String) request.getSession().getAttribute("codice_corso");
		String lessonCode = request.getParameter("lessonCode");
		System.out.println(courseCode + "HEEEEEEEEY");
		System.out.println(lessonCode);
		Boolean result = InstructorPageDataRecoverModel.recoverAttendanceData(response, lessonCode, courseCode);		
		if (result == false) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			//response.sendRedirect(request.getContextPath() + "/structure/errorpage.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		/*// TODO Auto-generated method stub
		System.out.println("Chiamata");
		String courseCode = (String) request.getSession().getAttribute("codice_corso");
		String lessonCode = request.getParameter("lessonCode");
		System.out.println(courseCode + "HEEEEEEEEY");
		System.out.println(lessonCode);
		InstructorPageDataRecoverModel.recoverAttendanceData(response, lessonCode, courseCode);		*/
	}

}
