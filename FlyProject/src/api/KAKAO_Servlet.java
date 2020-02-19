package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import connect.Script;





public class KAKAO_Servlet implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String clientId="7ca2d597fb4f77cef4c41fffe0add133";
	     String code=request.getParameter("code");
	     String state=request.getParameter("state");
		String redirectURI=URLEncoder.encode("http://localhost:8089/test333/KAKAO_Action","utf-8");
		String go="/test333/login/loginInfo.jsp";
	     
	     String apiURL;
	     apiURL = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code&";
	     apiURL += "client_id=" + clientId;
	     apiURL += "&redirect_uri=" + redirectURI;
	     apiURL += "&code=" + code;
	     apiURL += "&state=" + state;
	     String access_token = "";
	     String refresh_token = "";
	
	     System.out.println("apiURL="+apiURL);
	     try {
			 URL url=new URL(apiURL);
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode=con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode="+responseCode);
			if(responseCode==200) {
				br=new BufferedReader(new InputStreamReader(con.getInputStream()));				
			}else {
				br=new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res=new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
				
				System.out.println(access_token+"test5");
		    	System.out.println(refresh_token+"test6");
			}
			 br.close();
			 System.out.println(access_token+"test3");
		    	System.out.println(refresh_token+"test4");
			 if(responseCode==200) {
			        System.out.println(res.toString());	    	
			    	Script.moving(response, "success", go);
			        
			      }
			
			
		} catch (Exception e) {
	       System.out.println(e);
	  }
	     
	}
		
}


