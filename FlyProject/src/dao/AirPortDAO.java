package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connect.DBConnect;
import dto.AirPortDTO;

public class AirPortDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	AirPortDTO ato = new AirPortDTO();
	
	public AirPortDTO Flight_Search(String start_nation,String arrive_nation) {
		String sql="select airname,start_nation,arrive_nation,start_time,arrive_time from airport where start_nation like ? and arrive_nation like ?";
		con=DBConnect.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+start_nation+"%");
			pstmt.setString(2,"%"+arrive_nation+"%");
			rs=pstmt.executeQuery();
			System.out.println(sql);
			System.out.println(start_nation);
			System.out.println(arrive_nation);
			if(rs.next()) {
				AirPortDTO ato=new AirPortDTO();
				System.out.println("airTest");
				ato.setAirname(rs.getString("airname"));
		       ato.setStart_nation(rs.getString("start_nation"));
		       ato.setArrive_nation(rs.getString("arrive_nation"));
		       ato.setStart_time(rs.getString("start_time"));
		       ato.setArrive_time(rs.getString("arrive_time"));
		  
				return ato;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.close(con, pstmt,rs);
		}
	
		return null;
	}
	
	
}
