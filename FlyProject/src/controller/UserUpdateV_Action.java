package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import connect.Script;
import dao.UserDAO;
import dto.UserDTO;



public class UserUpdateV_Action implements Action {
	private String name="UserUpdate :";
       


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "login/my_info_view.jsp";
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		UserDAO dao=new UserDAO();
		UserDTO dto = dao.userInfo(email);
		request.setAttribute("dto", dto);
		
		if(dto == null){
			Script.moving(response, name+"database 에러");
		}else{
			RequestDispatcher dis = request.getRequestDispatcher(url);
			dis.forward(request, response);
		}
		
	}

}
