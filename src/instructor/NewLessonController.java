package instructor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewLessonController
 */
@WebServlet("/NewLessonController")
public class NewLessonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewLessonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("CREO LEZIONE");
		System.out.println(request.getParameter("data"));
		System.out.println(request.getParameter("presenze"));
		System.out.println((String) request.getSession().getAttribute("codice_corso"));
		Boolean result = InstructorPageDataRecoverModel.createLesson(request.getParameter("presenze"), request.getParameter("data"),(String) request.getSession().getAttribute("codice_corso"));
		if (result == false) {
			response.getWriter().write("Error");
		} else {
			response.getWriter().write("Success");
		}
 
	
	}

}
