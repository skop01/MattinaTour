package connect;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Script {
	public static void moving(HttpServletResponse response, String msg){
		try {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('"+msg+"')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void moving(HttpServletResponse response, String msg, String url){
		try {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('"+msg+"')");
			script.println("location.href = '"+url+"'");
			script.println("</script>");
			script.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void alert(HttpServletResponse response, String msg){
		try {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('"+msg+"')");
			script.println("</script>");
			script.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
