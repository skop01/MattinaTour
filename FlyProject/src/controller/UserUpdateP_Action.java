package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import connect.SHA256;
import connect.Script;
import dao.UserDAO;
import dto.UserDTO;

public class UserUpdateP_Action implements Action {
	private static String name = "UserUpdateP_Action : ";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String url="/FlyProject/?comand=view_form";
		   
		   UserDTO dto=new UserDTO();
		   UserDAO dao=new UserDAO();
		   
		  String email=request.getParameter("email");
		  String salt=dao.login_salt(email);
		  String passwd = SHA256.getEncrypt(request.getParameter("pwd"), salt);
		  String first_name=request.getParameter("f_name");
		  String last_name=request.getParameter("l_name");
		  String port=request.getParameter("port");
		  String issue=request.getParameter("issue");
		  String expiry=request.getParameter("expiry");
		  String birth=request.getParameter("birth");
		  String phone=request.getParameter("phone");
		  String number=request.getParameter("number");
		  
		  dto.setEmail(email);
		  dto.setPasswd(passwd);
		  dto.setFirst_name(first_name);
		  dto.setLast_name(last_name);
		  dto.setP_port(port);
		  dto.setP_issue(issue);
		  dto.setP_expiry(expiry);
		  dto.setBirth(birth);
		  dto.setN_number(phone);
		  dto.setP_number(number);
	
		  
		  
		  int result = dao.update(dto);
			if(result == 1){
				System.out.println(name+"성공");
				HttpSession session = request.getSession();
				session.setAttribute("email", dto.getEmail());
				Script.moving(response, "회원정보 수정 성공", url);
			}else if(result == -1){
				System.out.println(name+"sql error");
				Script.moving(response, "database 에러");
			}
		}
}
