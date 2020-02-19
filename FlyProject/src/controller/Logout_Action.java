package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;

public class Logout_Action implements Action{
	private static String name = "MemberLogoutAction : ";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(name);
		String url = "main_head.jsp";
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect(url);
	}
}
