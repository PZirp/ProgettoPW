package authentication;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthenticationFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		System.out.println("Nel filtro di autenticazione");
		HttpSession session = req.getSession();
		/* Dato che le JSP creano una sessione automaticamente, getSession() né ritornerà sempre una.
		 * Per sapere se la sessione è di login, c'è bisogno di controllare un parametro che viene aggiunto solo al momento del login,
		 * in questo caso Username
		 */
		if ((Boolean) session.getAttribute("logged") == null || (Boolean) session.getAttribute("logged") == false) {
			System.out.println("Utente non loggato");
			res.sendRedirect(req.getContextPath()+"/structure/Login.jsp");
			return;
		} else {		
			System.out.println("Utente loggato");
			System.out.println(session.getAttribute("username"));
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
