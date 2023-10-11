package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovieDao {

	Connection conn = null;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";

	public MovieDao() {
		try {
			// 로드
			Class.forName(driver);
			// 접속
			conn = DriverManager.getConnection(url,dbId,dbPw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//StudentDao
	public ArrayList<MovieBean> list() {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql= "select * from movie";
		ArrayList<MovieBean> lists = new ArrayList<MovieBean>();
		try {
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()) {
			MovieBean mb = new MovieBean();
			mb.setNum(Integer.parseInt(rs.getString("num")));
			mb.setId(rs.getString("id"));
			mb.setName(rs.getString("name"));
			mb.setAge(Integer.parseInt(rs.getString("age")));
			mb.setGenre(rs.getString("genre"));
			mb.setTime(rs.getString("time"));
			mb.setPartner(Integer.parseInt(rs.getString("partner")));
			mb.setMemo(rs.getString("memo"));
			lists.add(mb);
		}
		}catch(Exception e) {
			
		}finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println("lists.size():" + lists.size());
		return lists;
	}
	
	public int insert(MovieBean mb) {
		int cnt=0;
		PreparedStatement ps =null;
		String sql = "insert into movie values(mv_seq.nextval,?,?,?,?,?,?,?)";
		try {
			ps =conn.prepareStatement(sql);
			ps.setString(1,mb.getId());
			ps.setString(2,mb.getName());
			ps.setInt(3,mb.getAge());
			ps.setString(4,mb.getGenre());
			ps.setString(5,mb.getTime());
			ps.setInt(6,mb.getPartner());
			ps.setString(7,mb.getMemo());
			
			cnt =ps.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			try {
				conn.close();
				ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return cnt;
	}
	public boolean idCheck(String userid) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql= "select * from movie where id = ?";
		boolean isCheck=false;
		try {
		ps= conn.prepareStatement(sql);
		ps.setString(1, userid);
		rs=ps.executeQuery();
		if(rs.next()) {
			isCheck=true;
		}
		}catch(Exception e) {
			
		}finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return isCheck;
	}

	public int update(MovieBean mb) {
		int cnt=0;
		PreparedStatement ps =null;
		String sql = "update movie set name = ?,age = ?, genre= ?,time =?,partner = ?,memo=? where id=?";
		try {
			ps =conn.prepareStatement(sql);
			ps.setString(1,mb.getName());
			ps.setInt(2,mb.getAge());
			ps.setString(3,mb.getGenre());
			ps.setString(4,mb.getTime());
			ps.setInt(5,mb.getPartner());
			ps.setString(6,mb.getMemo());
			ps.setString(7,mb.getId());
			cnt =ps.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			try {
				conn.close();
				ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return cnt;
	}
	public MovieBean selectNum(int num) {

			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql= "select * from movie where num=?";
			MovieBean mb = new MovieBean();
			try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			if(rs.next()) {
				mb.setNum(Integer.parseInt(rs.getString("num")));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setAge(Integer.parseInt(rs.getString("age")));
				mb.setGenre(rs.getString("genre"));
				mb.setTime(rs.getString("time"));
				mb.setPartner(Integer.parseInt(rs.getString("partner")));
				mb.setMemo(rs.getString("memo"));
			}
			}catch(Exception e) {
				
			}finally {
				try {
					conn.close();
					ps.close();
					rs.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return mb;
		}
	public int delete(int num) {
		int cnt =0;
		String sql = "delete from movie where num = ? ";
		PreparedStatement ps =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			cnt =ps.executeUpdate();
		}catch(Exception e) {
			
		}finally {
			try {
				conn.close();
				ps.close();
			} catch (Exception e2) {
			}
		}
		
		return cnt;
	}
	public int deleteCheckData(String[] rowcheck) {
		
		PreparedStatement ps =null;
		int cnt =-1;
		String sql = "delete movie where num = ? ";
		for(int i=0;i<rowcheck.length-1;i++) {
			sql +=" or num=?";
		}
		
		try {
			ps = conn.prepareStatement(sql);
			for(int i=1;i<=rowcheck.length;i++) {
				ps.setString(i, rowcheck[i-1]);
			}
			cnt = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	}



