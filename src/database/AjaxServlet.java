package database;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

 	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml");
		Gson gson = new Gson();
		
		
		//Qui sotto funziona 
		
		/*String json = (String) request.getHeader("json");
		
		System.out.println(json);

		CodiceFiscale[] cf = gson.fromJson(json, CodiceFiscale[].class);

		if (cf != null) {
			for (int i = 0; i < cf.length; i++) {
				System.out.println(cf[i].getCodFisc());
			}
		}
		
		Finder finder = new Finder();
		ArrayList<Allievo> result = new ArrayList<>();
		
		for (int i = 0; i < cf.length; i++) {
			result.add(finder.find(cf[i].getCodFisc()));
			System.out.println("Risultato: " + gson.toJson(result));
		}
		
		response.getWriter().write(gson.toJson(result));
		
		*/
		//-----
		
		if (request.getParameter("ajax") != null) {
			System.out.println("Richiesta AJAX");	
		}
		
		System.out.println(request.getParameter("lista"));
	//	if (request.getParameter("lista").equals("studenti")) {
			System.out.println("Wel�");	
			System.out.println("Eccomi qui");
			Finder finder = new Finder();
			ArrayList<Allievo> result = finder.listaFrequentanti(request.getParameter("codice"));
			response.getWriter().write(gson.toJson(result));
			System.out.println(gson.toJson(result));
		//}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
