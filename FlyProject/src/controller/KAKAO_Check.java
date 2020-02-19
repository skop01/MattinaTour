package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.UserDAO;

public class KAKAO_Check implements Action {
          String name="KAKAO_Check : ";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           String email=request.getParameter("email");
           
           response.getWriter().write(new UserDAO().kakaoCheck(email)+"");
           
  	     	System.out.println(name+""+email);
		
	}

}
