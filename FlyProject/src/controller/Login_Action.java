package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import connect.SHA256;
import connect.Script;
import dao.UserDAO;
import dto.UserDTO;


public class Login_Action implements Action {
	private static String name = "LoginAction : ";
       

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String url = "main_head.jsp";
		
	          UserDAO dao=new UserDAO();
	          UserDTO dto=new UserDTO();
	          request.setCharacterEncoding("UTF-8");
	          response.setContentType("text/html;charset=UTF-8");
	          
	          String email=request.getParameter("email");
	  
	          String salt=dao.login_salt(email);
	          
	          if(email==null) {
	        	  Script.moving(response,"이메일이 존재하지 않습니다.");
	          }
	  		String passwd = SHA256.getEncrypt(request.getParameter("passwd"), salt);
	          dto.setEmail(email);
	          dto.setPasswd(passwd);
	       
	          if(request.getParameter("email_save") != null){
	  			Cookie cookie = new Cookie("cookieID",dto.getEmail());
	  			cookie.setMaxAge(6000);
	  			response.addCookie(cookie);
	  		}else{
	  			Cookie cookie = new Cookie("cookieID",null);
	  			cookie.setMaxAge(0);
	  			response.addCookie(cookie); 
	  		}

	  		int result = dao.login_select(dto);
	  		if(result == 1){
	  			HttpSession session = request.getSession();
	  			session.setAttribute("email", dto.getEmail());
	  			Script.moving(response, "로그인 성공", url);
	  		}else{
	  			System.out.println(name+"sql error");
	  			Script.moving(response, "비밀번호를 확인하세요.");
	  		}       
	          

		 	
	}	
	
	

}
