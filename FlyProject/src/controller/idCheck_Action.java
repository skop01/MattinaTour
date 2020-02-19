package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.UserDAO;


public class idCheck_Action implements Action {
private static String name="idCheck :";
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.setCharacterEncoding("UTF-8");

    		response.setContentType("text/html; charset=UTF-8");

    		String email=request.getParameter("email");

    		response.getWriter().write(new UserDAO().idCheck(email)+"");
          
    	     System.out.println(name+""+email);
     
     }
}