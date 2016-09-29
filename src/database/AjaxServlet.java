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
		//String cf = request.getParameter("cf");
		//Finder finder = new Finder();
		//String result = finder.find(cf);
		//Scanner sc = new Scanner(result);
		Gson gson = new Gson();

		/*Allievo a1 = new Allievo();
		a1.setCognome("Zirpoli");
		a1.setNome("Paolo");
		Allievo a2 = new Allievo();
		a2.setCognome("Avella");
		a2.setNome("Diego");
		
		ArrayList<Allievo> allievi = new ArrayList<>();
		
		allievi.add(a1);
		allievi.add(a2);		
		response.getWriter().write(gson.toJson(allievi));*/
		
		/*Enumeration names = request.getHeaderNames();
		
		while(names.hasMoreElements()) {
			System.out.println((String) names.nextElement());
		}*/
		
		//Qui sotto funziona 
		/*
		String json = (String) request.getHeader("json");
		
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
		
		System.out.println(request.getParameter("value"));
		if (request.getParameter("value").equals("studenti")) {
			System.out.println("Eccomi qui");
			Finder finder = new Finder();
			ArrayList<Allievo> result = finder.listaFrequentanti(request.getParameter("codice"));
			response.getWriter().write(gson.toJson(result));
			System.out.println(gson.toJson(result));
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
