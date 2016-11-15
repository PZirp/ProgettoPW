package instructor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewExamController
 */
@WebServlet("/NewExamController")
public class NewExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewExamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json");
		System.out.println("CREO ESAME");
		System.out.println(request.getParameter("data"));
		System.out.println(request.getParameter("voti"));
		System.out.println((String) request.getSession().getAttribute("codice_corso"));
		Boolean result = InstructorPageDataRecoverModel.createExam(request.getParameter("voti"), request.getParameter("data"),(String) request.getSession().getAttribute("codice_corso"));
		if (result == false) {
			response.getWriter().write("Error");
		} else {
			response.getWriter().write("Success");
		}	
	}

}
