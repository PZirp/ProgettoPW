package publicPages;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class genericPageServlet
 */
@WebServlet("/genericPageServlet")
public class genericPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public genericPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String page = request.getParameter("page");
		if (page == null) {
			response.sendError(404);
		} else {
			System.out.println("Eccomi qui!!");
			new pageBuilder().buildPage(request, page);
			System.out.println("Nella servlet"); 
			RequestDispatcher view = request.getRequestDispatcher("/structure/Home.jsp");
			System.out.println("Dopo reqeustdispatcher");
			view.forward(request, response);
			System.out.println("dopo forward"); 
			/*request.setAttribute("Titolo1", "prova");
			RequestDispatcher view = request.getRequestDispatcher("/structure/Home.jsp");
			view.forward(request, response);*/
		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}