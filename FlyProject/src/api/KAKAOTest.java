package api;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
public class KAKAOTest {
	    public static void main(String[] args) {
	        String token = "X0NFdeIDljp94FOl9_XJXnHzHQX-1E9eYGsmMgoqAysAAAFvra6qUw";
	        String header = "Bearer " + token;
	        try {
	            String apiURL = "https://kapi.kakao.com/v2/user/me";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            System.out.println(response.toString());
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	    }
}
