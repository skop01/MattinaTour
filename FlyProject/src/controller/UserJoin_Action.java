package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import connect.SHA256;
import connect.Script;
import dao.UserDAO;
import dto.UserDTO;

public class UserJoin_Action implements Action {
	private static String name = "UserJoinAction : ";
       
    @Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "login/sign_up_com.jsp";
		String salt=SHA256.generateSalt();
		String pwd = SHA256.getEncrypt(request.getParameter("pwd"), salt);
   
     
     UserDTO dto=new UserDTO();
     dto.setEmail(request.getParameter("email"));
     dto.setPasswd(pwd);
     dto.setFirst_name(request.getParameter("f_name"));
     dto.setLast_name(request.getParameter("l_name"));
     dto.setNational(request.getParameter("national"));
     dto.setN_number(request.getParameter("phone"));
     dto.setP_number(request.getParameter("number"));
     dto.setP_port(request.getParameter("port"));
     dto.setP_issue(request.getParameter("issue"));
     dto.setP_expiry(request.getParameter("expiry"));
     dto.setGender(request.getParameter("gender"));
     dto.setBirth(request.getParameter("birth"));
     dto.setSalt(salt);

    
     int result=new UserDAO().insert(dto);
     request.setAttribute("dto", dto);
     if(result == 1){
			RequestDispatcher dis = request.getRequestDispatcher(url);
			dis.forward(request, response);
			 
		}else if(result==-1){
			System.out.println(name+"sql error");
			Script.moving(response, "실패에에엥");
		}       
     
 
	}

}
