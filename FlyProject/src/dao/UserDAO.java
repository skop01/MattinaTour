package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connect.DBConnect;
import dto.UserDTO;

public class UserDAO {
private Connection con;
private PreparedStatement pstmt;
private ResultSet rs;
//private ResultSet rs2;
UserDTO dto=new UserDTO();

public int insert(UserDTO dto) {
	String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	con=DBConnect.getConnection();
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getEmail());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getFirst_name());
		pstmt.setString(4, dto.getLast_name());
		pstmt.setString(5, dto.getNational());
		pstmt.setString(6, dto.getN_number());
		pstmt.setString(7,dto.getP_number());
		pstmt.setString(8,dto.getP_port());
		pstmt.setString(9,dto.getP_issue());
		pstmt.setString(10,dto.getP_expiry());
		pstmt.setString(11,dto.getGender());
		pstmt.setString(12,dto.getBirth());
		pstmt.setString(13,dto.getSalt());
		pstmt.executeUpdate();
		return 1;
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBConnect.close(con, pstmt);
	}
	return -1;
}



public int login_select(UserDTO dto) {
	String sql="select * from user where email=? and passwd=?";
	con=DBConnect.getConnection();
	try {
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,dto.getEmail());
		pstmt.setString(2,dto.getPasswd());
		rs=pstmt.executeQuery();
		if(rs.next()) {
			System.out.println(
			rs.getString(1)+" "+
			rs.getString(2));
			
			System.out.println("fuck111");
			return 1;
		}
		
		System.out.println("fuck");
		return 0;
	
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		DBConnect.close(con, pstmt,rs);
	}
	return -1;
}


public String login_salt(String email) {
	String sql="select salt from user where email=?";
	con=DBConnect.getConnection();
	try {
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, email);
		rs=pstmt.executeQuery();
		
		
		if(rs.next()) {
			String salt = rs.getString("salt");
			return salt;
			
		}
			
		
	} catch (Exception e) {
		e.printStackTrace();

	}finally {
		DBConnect.close(con, pstmt,rs);
	}
	return null;

	
}

public UserDTO userInfo(String email) {
	String sql="select email,passwd,first_name,last_name,birth,national,gender,P_port,P_issue,P_expiry,N_number,P_number from user where email=?";
	con=DBConnect.getConnection();
	try {
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,email);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			UserDTO dto=new UserDTO();
			dto.setEmail(rs.getString("email"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setFirst_name(rs.getString("first_name"));
			dto.setLast_name(rs.getString("last_name"));
			dto.setBirth(rs.getString("birth"));
			dto.setNational(rs.getString("national"));
			dto.setN_number(rs.getString("N_number"));
			dto.setP_number(rs.getString("P_number"));
			dto.setP_port(rs.getString("P_port"));
			dto.setP_issue(rs.getString("P_issue"));
			dto.setP_expiry(rs.getString("P_expiry"));
			dto.setGender(rs.getString("gender"));
			
		    return dto;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		DBConnect.close(con, pstmt,rs);
	}
	return null;
}


public int update(UserDTO dto) {
	String sql="update user set passwd=?, first_name=?, last_name=?,birth=?,P_port=?,P_issue=?,P_expiry=?,N_number=?,P_number=? where email=?";
	con=DBConnect.getConnection();
	try {
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,dto.getPasswd());
		pstmt.setString(2,dto.getFirst_name());
		pstmt.setString(3,dto.getLast_name());
		pstmt.setString(4,dto.getBirth());
		pstmt.setString(5,dto.getP_port());
		pstmt.setString(6,dto.getP_issue());
		pstmt.setString(7,dto.getP_expiry());
		pstmt.setString(8,dto.getN_number());
		pstmt.setString(9,dto.getP_number());
		pstmt.setString(10,dto.getEmail());
		return pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		DBConnect.close(con, pstmt);
	}
	return -1;
}
public int kakaoCheck(String email) {
	con=DBConnect.getConnection();
	String sql="select * from kakao_user where email = ?";
	try {
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,email);
		rs=pstmt.executeQuery();
		if(rs.next()||email.equals("")) {
               return 0;			
		}else {
			System.out.println(email);
			return 1;
		}
	} catch (Exception e) {
	    e.printStackTrace();
	}finally {
		DBConnect.close(con, pstmt,rs);
	}
	return -1;
}

	
	public int idCheck(String email) {

		System.out.println("test1");
		con=DBConnect.getConnection();
		String sql="select * from user where email = ?";
		try {
			System.out.println("test2");
			pstmt=con.prepareStatement(sql);
			System.out.println("test3");
			pstmt.setString(1,email);
			System.out.println("test4");
			rs=pstmt.executeQuery();			
			if(rs.next()||email.equals("")) {
		
				return 0;
			}else {
				System.out.println(email);
				return 1;
			}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnect.close(con, pstmt,rs);
			}
		return -1;
			
		} 
	 
	}
