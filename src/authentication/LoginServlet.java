package authentication;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AuthenticatorModel auth = new AuthenticatorModel();
		String role = auth.authenticate(username, password);
		HttpSession session = request.getSession();		
		
		if (role == null) {
			System.out.println("Role = null");
			session.setAttribute("logged", false);
			request.setAttribute("not-found", "true");
			RequestDispatcher view = request.getRequestDispatcher("/structure/Login.jsp");
			view.forward(request, response);
		} else {
			session.setMaxInactiveInterval(120);
			session.setAttribute("username", username);
			session.setAttribute("logged", true);
			session.setAttribute("role", role);
			//response.sendRedirect(request.getContextPath() + "/structure/PrivatePage.jsp");
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/instructorPage"));
			/*RequestDispatcher dispatcher = request.getRequestDispatcher(response.encodeURL("/instructorPage"));
			dispatcher.forward(request, response);*/
		}
	}

}
