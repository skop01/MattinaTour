package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionFactory;

@WebServlet("/")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String name="Controller : ";
       

    public Controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println(name+"GET");
		doProcess(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println(name+"POST");
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); 
		String comand = request.getParameter("comand");
		System.out.println(name+comand);
		ActionFactory af=ActionFactory.getInstance();
		Action action=af.getAction(comand);
		if(action != null) action.execute(request, response);
	}

}
