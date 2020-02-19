package connect;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieSave {
	private static String naming = "Cookie : ";
	
	
	
	public static String getMyCookie(HttpServletRequest request) {
		String cookieID = null;

		Cookie[] cookies = request.getCookies();

		for (Cookie c : cookies) {
			if (c.getName().equals("cookieID")) {
			
				cookieID = c.getValue();
			}
		}
		System.out.println(naming+cookieID);
		return cookieID;
	}

	
}
