package instructor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		//System.out.println("Pagina istruttore");
		//System.out.println(request.getRequestURL());
		HttpSession session = request.getSession();
		if (session.getAttribute("nome") == null) {
			Boolean result = InstructorPageDataRecoverModel.retrieveInstructorData(request, (String) request.getSession().getAttribute("username"));
			if (result == false) {
				response.sendError(response.SC_FORBIDDEN);
//				response.sendRedirect(request.getContextPath() + "/structure/errorpage.jsp");
				return;
			}
			/*In caso sia una nuova sessione senza dati memorizzati, fa una query al database, e salva i dati trovati nella sessione */
			session.setAttribute("nome", request.getAttribute("nome"));
			session.setAttribute("cognome", request.getAttribute("cognome"));
			session.setAttribute("corso", request.getAttribute("corso"));
			session.setAttribute("id", request.getAttribute("id"));
			session.setAttribute("grado", request.getAttribute("grado"));
			session.setAttribute("codice_corso", request.getAttribute("codice_corso"));
			session.setAttribute("nome_corso", request.getAttribute("nome_corso"));
			session.setAttribute("mum_iscritti", request.getAttribute("mum_iscritti"));
			session.setAttribute("sede", request.getAttribute("sede"));		
			//DA FARE SEMPRE ALTRIMENTI NON FUNZIONA PIU' NULLA
			session.setAttribute("codice_corso", request.getAttribute("codice_corso"));

		} 
		/*Se non è una sessione nuova, ed i dati sono già presenti, fa direttamente il forward alla JSP senza interpellare il database*/
		/*request.setAttribute("nome", session.getAttribute("nome"));
		request.setAttribute("cognome", session.getAttribute("cognome"));
		request.setAttribute("corso", session.getAttribute("corso"));
		request.setAttribute("id", session.getAttribute("id"));
		request.setAttribute("grado", session.getAttribute("grado"));
		request.setAttribute("codice_corso", session.getAttribute("codice_corso"));
		request.setAttribute("nome_corso", session.getAttribute("nome_corso"));
		request.setAttribute("mum_iscritti", session.getAttribute("mum_iscritti"));
		request.setAttribute("sede", session.getAttribute("sede"));*/
		RequestDispatcher rd = request.getRequestDispatcher(response.encodeURL("/structure/instructorPages/InstructorPage.jsp"));
		rd.forward(request, response);
		
		
		/*if (result == false) {
			response.sendRedirect(request.getContextPath() + "/structure/errorpage.jsp");
		} else {
			request.getSession().setAttribute("codice_corso", request.getAttribute("codice_corso"));
			RequestDispatcher rd = request.getRequestDispatcher(response.encodeURL("/structure/instructorPages/InstructorPage.jsp"));
			rd.forward(request, response);
		}*/
	}

}
