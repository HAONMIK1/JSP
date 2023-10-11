package mypkg;

import java.sql.*;
import java.util.ArrayList;

public class EmplDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String sqlid = "sqlid";
	String sqlpw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public EmplDao() {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, sqlid, sqlpw);
		} catch (Exception e) {
			System.out.print("드라이버 실패");
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e) {
			}
		}

	}
	public ArrayList<EmplBean> getAllEmpls(){
		String sql = "select * from empl order by mid";
		ArrayList<EmplBean> lists = new ArrayList<EmplBean>();
		try{ 
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();		
			while(rs.next()) {
				int mid = rs.getInt("mid");
				String name = rs.getString("name");
				int depart = rs.getInt("depart");
				int salary = rs.getInt("salary");

				EmplBean eb =new EmplBean();
				eb.setMid(mid);
				eb.setDepart(depart);
				eb.setName(name);
				eb.setSalary(salary);
				lists.add(eb);
			}
		} catch (Exception e) {
			System.out.print("드라이버 실패");
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e) {
			}
		}

		System.out.println("lists size :" + lists.size());
		return lists;
	}
	public int insetData(EmplBean eb) {

		String sql = "insert into empl values(e_seq.nextval,?,?,?)";
		int cnt =-1;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, eb.getName());
			ps.setInt(2, eb.getDepart());
			ps.setInt(3, eb.getSalary());
			cnt =ps.executeUpdate();
			System.out.println("cnt :"+cnt);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return cnt;
	}
	public EmplBean getEmplByMid(int mid) {
		EmplBean eb = new EmplBean();
		String sql = "select * from empl where mid =?";
		try {
			ps =conn.prepareStatement(sql);
			ps.setInt(1, mid);
			rs=ps.executeQuery();
			if(rs.next()) {
				eb.setName(rs.getString("name"));
				eb.setDepart(rs.getInt("depart"));
				eb.setSalary(rs.getInt("salary"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(conn!=null)
					conn.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return eb;
	}
	public int updateData(EmplBean eb) {

		String sql = "update empl set name=?, depart=?, salary=? where mid =?";
		int cnt =-1;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, eb.getName());
			ps.setInt(2, eb.getDepart());
			ps.setInt(3, eb.getSalary());
			ps.setInt(4, eb.getMid());
			cnt =ps.executeUpdate();
			System.out.println("cnt :"+cnt);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return cnt;
	}
	public int deleteData(int mid) {
		
		String sql = "delete from empl where mid =?";
		int cnt =-1;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, mid);
			cnt =ps.executeUpdate();
			System.out.println("cnt :"+cnt);
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return cnt;
	}
}
