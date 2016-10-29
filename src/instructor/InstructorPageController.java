package instructor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class instructorPage
 */
@WebServlet("/instructorPage")
public class InstructorPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstructorPageController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("Pagina istruttore");
		System.out.println(request.getRequestURL());
		Boolean result = InstructorPageDataRecoverModel.retrieveInstructorData(request, (String) request.getSession().getAttribute("username"));
		if (result == false) {
			response.sendRedirect(request.getContextPath() + "/structure/errorpage.jsp");
		} else {
			request.getSession().setAttribute("codice_corso", request.getAttribute("codice_corso"));
			RequestDispatcher rd = request.getRequestDispatcher(response.encodeURL("/structure/instructorPages/InstructorPage.jsp"));
			rd.forward(request, response);
		}
	}

}
